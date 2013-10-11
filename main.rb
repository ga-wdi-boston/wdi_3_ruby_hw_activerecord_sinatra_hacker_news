require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'wdinews',
                host: 'localhost'}

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
  Story.create(title: params[:title], link: params[:link], body: params[:body], up_votes: 0, down_votes: 0)
  redirect '/'
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
  Story.update(params[:id], title: params[:title], link: params[:link], body: params[:body])
  redirect '/'
end

get '/upvote/:id' do
  Story.increment_counter(:up_votes, params[:id])
  redirect '/'
end