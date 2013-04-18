require 'cf-runtime'
require 'data_mapper'
require 'msgpack'
require 'redis'

class Post
  include DataMapper::Resource
  include CFRuntime

  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime

  def self.init
    @@log = DataMapper::Logger.new($stdout, :debug)
    DataMapper::setup(:default, db_url)
    DataMapper.finalize
    Post.auto_upgrade!
  end

  def self.db_url
    if CloudApp.running_in_cloud?
      svc = CloudApp.service_props 'blog-db'
      "mysql://#{svc[:username]}:#{svc[:password]}@#{svc[:host]}:#{svc[:port]}/#{svc[:database]}"
    else
      "sqlite3:blog.db"
    end
  end

  # Overrided
  def self.get(key)
    cache = connect_to_cache
    if value = cache.get(key)
      @@log << "CACHE HITTED!"
      post = decode(value)
    else
      @@log << "CACHE MISSED!"
      post = super(key)
      cache.set(key, post.encode)
    end
    cache.quit
    post
  rescue Redis::CannotConnectError
    @@log << "CACHE CONNECT ERROR!"
    super(key)
  end

  def self.connect_to_cache
    if CloudApp.running_in_cloud?
      CFRuntime::RedisClient.create_from_svc 'blog-cache'
    else
      Redis.new
    end
  end

  def self.decode(str)
    self.new(MessagePack.unpack(str))
  end

  def encode
    props = [:id, :title, :body, :created_at].map { |prop| [prop, send(prop).to_s] }
    Hash[props].to_msgpack
  end
end

Post.init
