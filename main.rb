require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'ga-hacker-news',
                host: 'localhost'}

class Post < ActiveRecord::Base
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :post
end

get '/' do 
  @posts = Post.all.order("total_votes DESC")
  erb :post_index
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :post_edit
end

post '/posts/:id/delete' do
  Post.find(params[:id]).destroy
  redirect '/'
end

get '/posts/new' do
  erb :post_new
end

post '/posts/create' do
  if params[:link] != "" && params[:body] != ""
    redirect '/posts/new'
  elsif params[:link] == "" && params[:body] == ""
    redirect '/posts/new'
  else
    Post.create(title: params[:title], link: params[:link], body: params[:body], up_votes: 0, down_votes: 0)
    redirect '/'
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :post_show
end

post '/posts/:id/upvote' do
  up_votes = Post.find(params[:id]).up_votes
  up_votes += 1
  total_votes = Post.find(params[:id]).total_votes
  total_votes += 1
  Post.update(params[:id], :up_votes => up_votes, :total_votes => total_votes)
  redirect '/'
end

post '/posts/:id/downvote' do
  down_votes = Post.find(params[:id]).down_votes
  down_votes += 1
  #shorthand is increment!(attribute, by = 1)
  total_votes = Post.find(params[:id]).total_votes
  total_votes -= 1
  #decrement!(attribute, by = 1)
  Post.update(params[:id], :down_votes => down_votes,  :total_votes => total_votes)
  redirect '/'
end

post '/posts/:id/update' do
  Post.update(params[:id], :title => params[:title], :body => params[:body], :link => params[:link])
  redirect '/'
end

