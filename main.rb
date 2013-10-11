require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql', database: 'hacknews', host: 'localhost'}

   #  create_table :posts do |t|
   #  	t.text :title
   #  	t.text :link
   #  	t.text :body
   #  	t.integer :up_votes
   #  	t.integer :down_votes
   #  	t.timestamp :timestamp
   # end

class Post < ActiveRecord::Base
end

get '/hackernews' do
	@posts = Post.all
	erb :post_index
end

get '/hackernews/new' do
	erb :post_new
end

# This should be run by hitting the submit button on the /new page. <form action='hackernews/create' method='post'>COLLECT CONTENT</form>
post '/hackernews/create' do
	post = Post.create(title: params[:title], link: params[:link], body: params[:body], up_votes: 0, down_votes: 0)
	redirect '/hackernews'
end

get '/hackernews/:id' do
	@post = Post.find(params[:id])
	erb :post_show
end

post '/hackernews/destroy' do

	redirect '/hackernews'
end


