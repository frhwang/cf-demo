require 'cf-runtime'
require 'data_mapper'
require 'amqp'
require 'json'

class Post
  include DataMapper::Resource
  include CFRuntime

  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime

  def self.init
    DataMapper::Logger.new($stdout, :debug)
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

  # overrided
  def save
    if super
      notify_posting
      true
    else
      false
    end
  end

  def notify_posting
    payload = { :title => @title, :created_at => @created_at }.to_json
    AMQP::Channel.new do |channel|
      channel.fanout("feed_ch").publish(payload) do
        channel.close
      end
    end
  end
end

Post.init
