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
  erb :index
end

get '/new' do 
  erb :new
end

post '/create' do 
  @story = Story.create(title: params[:title], 
                       link: params[:link], 
                       body: params[:body])
  redirect "/"
end

get '/:id' do 
  @story = Story.find(params[:id])
  erb :show
end

get '/:id/delete' do 
  Story.delete(params[:id])
  redirect '/'
end

get '/:id/edit' do
  @story = Story.find(params[:id])
  erb :edit
end

post '/:id/update' do 
  @story = Story.update(params[:id],
                        title: params[:title],
                        link: params[:link],
                        body: params[:body])
  redirect '/'
end