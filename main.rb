require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
								database: 'danhacker',
								host: 'localhost'}
class Story <ActiveRecord::Base
end

get '/' do
	@stories = Story.all
	erb :front_page
end

# This will be for showing the form to create new posts
get '/new' do
	erb :post_new
end

get '/:id' do 
  @story = Story.find(params[:id])
  erb :show_story
end

post '/create' do 
  Story.create(title: params[:title], 
                       link: params[:link], 
                       body: params[:body])
  redirect '/'
end