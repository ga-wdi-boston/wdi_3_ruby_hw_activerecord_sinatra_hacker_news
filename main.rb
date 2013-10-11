require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
				database: 'ga-hacker-news',
				host: 'localhost'}

class Story < ActiveRecord::Base
end

get '/hacknews' do 
	@stories = Story.all
	erb :news_index 
end 

get 'hacknews/new/text' do 
	erb :news_newtext
end 

get 'hacknews/new/link' do 
	erb :news_newlink
end 

post '/hacknews/create/title-link' do
story = Story.create(title: params[:title], link: params[:link])
redirect '/hacknews' #come back to this redirect
end 

post '/hacknews/create/title-body' do
	story = Story.create(title: params[:title], link: params[:link])
	redirect '/hacknews' #come back to this redirect
end 





