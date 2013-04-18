require 'sinatra'
require 'cf-runtime'
require_relative 'post'

configure do
  EM.next_tick do
    if CFRuntime::CloudApp.running_in_cloud?
      AMQP.connection = CFRuntime::AMQPClient.create_from_svc 'blog-mq'
    else
      AMQP.connection = AMQP.connect
    end
  end
end

get '/' do
  @posts = Post.all(:order => [:id.desc])
  erb :index
end

get '/post/new' do
  erb :new
end

get '/post/:id' do
  @post = Post.get(params[:id])
  erb :post
end

post '/post/create' do
  post = Post.new(:title => params[:title], :body => params[:body])
  if post.save
    status 201
    redirect "/post/#{post.id}"
  else
    status 412
    redirect '/'
  end
end
