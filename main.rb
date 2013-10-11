require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, { adapter: 'postgresql',
                 database: 'hn-stories',
                 host: 'localhost' }

class Story < ActiveRecord::Base
end

get '/' do
  @stories = Story.all 
  erb :story_index
end

get '/new' do 
  erb :new_story
end

post '/create' do 
  story = Story.create(title: params[:title], 
                       link: params[:link], 
                       body: params[:body])
  redirect "/#{story.id}"
end

get '/:id' do 
  @story = Story.find(params[:id])
  erb :show_story
end