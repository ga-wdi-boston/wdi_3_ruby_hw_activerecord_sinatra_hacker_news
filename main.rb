require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
								database: 'ar-sinatra',
								host: 'localhost'}

class Post < ActiveRecord::Base
end

# This will display all post from DB
get '/' do
	@posts = Post.all
	erb :post_index
end

get '/new' do
	erb :post_new
end

post '/create' do
	post = Post.create(title: params[:title], body: params[:body])
	redirect "/#{post.id}"
end

get '/:id' do
	@post = Post.find(params[:id])
	erb :post_show
end


