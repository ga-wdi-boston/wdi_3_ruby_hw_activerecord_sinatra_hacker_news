require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql', database: 'ga-hacker-news', host:'localhost'}


class Post < ActiveRecord::Base
end

get '/' do
	@posts = Post.all
	erb :post_index
end

