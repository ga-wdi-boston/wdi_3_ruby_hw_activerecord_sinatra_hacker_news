require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'rake'

set :database, {adapter:'postgresql',
  				database: 'ga-class-posts',
  				host: 'localhost'}

class Story < ActiveRecord::Base
end  

get '/' do 
	@stories = Story.all
	erb :stories_index
end

get '/story/new' do 
	erb :stories_new
end

post '/story/create' do
  Story.create(title: params[:title])
  redirect '/'
end

get '/story/:id'
end