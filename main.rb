require 'pry'
require 'pg'
require 'rake'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, 	{adapter: "postgresql",
					database: "ga-ar-homework",
					host: "localhost"}

class Post < ActiveRecord::Base 
end

get '/index' do 
	@posts = Post.all
	erb :index_posts
end

get '/index/new' do
	erb :add_post
end

post '/index/create' do
	post = Post.create(link: params[:link],  title: params[:title], body: params[:body])
	redirect "/index/#{post.id}"
end

get '/index/:id' do
	@post = Post.find(params[:id])
	erb :indiv_post
end