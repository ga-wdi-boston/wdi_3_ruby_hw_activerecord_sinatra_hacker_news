require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
				database: 'hackernews',
				host: 'localhost'}

class Story < ActiveRecord::Base
end

get '/hackernews' do
	@stories = Story.all
	@stories.order("upvotes DESC")
	erb :index	
end

get '/hackernews/:id/edit' do
	@story = Story.find(params[:id])

	erb :story_edit
end

post '/hackernews/:id/update' do
	title = params[:title]
	url = params[:url]
	body = params[:body]
	@story = Story.find(params[:id])
	@story.update(title: title, url: url, body: body)

	redirect "/hackernews/#{params[:id]}"
end

get '/hackernews/:id/delete' do
	Story.find(params[:id]).delete
	redirect '/hackernews'
end

get '/hackernews/new' do
	erb :story_new
end

get '/hackernews/:id' do
	@story = Story.find(params[:id])

	erb :story
end

post '/hackernews/create' do
	title = params[:title]
	url = params[:url]
	body = params[:body]
	@stories = Story.all
	@story = Story.create(title: title, url: url, body: body, upvotes: 0, downvotes: 0)

	redirect '/hackernews'
end

post '/hackernews/:id/upvotes' do
	upvoted = Story.find(params[:id])
	upvoted[:upvotes] += 1
	upvoted.save
	redirect "/hackernews"
end

post '/hackernews/:id/downvotes' do
	downvoted = Story.find(params[:id])
	downvoted[:downvotes] += 1
	downvoted.save
	redirect "/hackernews"
end