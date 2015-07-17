require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',database: 'ga-hacker-news', host: 'localhost'}

	class Story < ActiveRecord::Base
		has_many :comments 
	end

	class Comment < ActiveRecord::Base
	end 

	get '/hacknews' do 
		@stories = Story.all
		erb :news_index 
	end 

	get '/hacknews/new/text' do 
		erb :news_newtext
	end 

	get '/hacknews/new/link' do 
		erb :news_newlink
	end 

	post '/hacknews/new/hacknews/create/title-link' do
		@story = Story.create(title: params[:title], link: params[:link])
	redirect '/hacknews' #come back to this redirect
	end 

	post '/hacknews/new/hacknews/create/title-text' do
		@story = Story.create(title: params[:title], link: params[:link])
		redirect '/hacknews' #come back to this redirect
	end 

	get '/hacknews/:id/edit' do 
		id = params[:id]
		@story = Story.find(params[:id])
		erb :news_edit
	end

	post 'hacknews/:id/update' do #update
		id = params[:id]
		@story = Story.find(params[:id]).update_attributes(title: params[:title], link: params[:link],body: params[:body])
  		redirect '/hacknews'
  	end 
  
	post '/hacknews/:id/delete' do
		id = params[:id]
		@story = Story.find(params[:id]).delete
		redirect '/hacknews'
	end 

	post '/hacknews/:id/voteup' do 
		id = params[:id]
		@voteup =Story.increment_counter(:up_votes, params[:id])
		redirect '/hacknews'
	end 

	post '/hacknews/:id/votedown' do
	id = params[:id]
	@voteup =Story.increment_counter(:down_votes, params[:id])
	redirect '/hacknews'
	end

	get '/hacknews/:id/newcomment' do
	@story_id = params[:id]
	erb :comments_new 
	end 

	post '/hacknews/:id/addcomments' do
	story_id = params[:id]
	@comments=Comment.create(story_id: story_id, author: params[:author], body: params[:body]) 
	redirect '/hacknews'
	end

















