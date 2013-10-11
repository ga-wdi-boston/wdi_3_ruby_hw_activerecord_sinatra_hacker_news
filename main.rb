require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
								database: 'dan_hacker',
								host: 'localhost'}
class Post <ActiveRecord::Base
end

get '/' do
	@posts = Post.all
	erb :front_page
end

# This will be for showing the form to create new posts
get '/new' do
	erb :post_new
end