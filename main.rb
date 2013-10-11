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