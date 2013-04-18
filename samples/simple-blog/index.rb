require 'sinatra'
require_relative 'post'

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
