require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql', database: 'hacknews', host: 'localhost'}

class Post < ActiveRecord::Base
end

get '/hackernews' do
	@posts = Post.all
	erb :post_index
end

get '/hackernews/new' do
	erb :post_new
end

get '/hackernews/:id' do
	@post = Post.find(params[:id])
	erb :post_show
end

# This should be run by hitting the submit button on the /new page. <form action='hackernews/create' method='post'>COLLECT CONTENT</form>
post '/hackernews/create' do
	post = Post.create(title: params[:title], link: params[:link], body: params[:body], up_votes: 0, down_votes: 0)
	redirect '/hackernews'
end

post '/hackernews/:id/destroy' do
	Post.find(params[:id]).delete
	redirect '/hackernews'
end

post '/hackernews/:id/update' do
	title = params[:title]
	link = params[:link]
	body = params[:body]
	Post.find(params[:id]).update(title: title, link: link, body: body)
	redirect '/hackernews/:id'
end

get '/hackernews/:id/edit' do
	@post = Post.find(params[:id])
	erb :post_edit
end

