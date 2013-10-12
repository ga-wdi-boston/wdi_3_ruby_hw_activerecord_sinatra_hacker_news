require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
								database: 'danhacker',
								host: 'localhost'}
class Story < ActiveRecord::Base
  has_many :comments
end 

class Comment < ActiveRecord::Base
  belongs_to :stories
end 


get '/' do
	@stories = Story.all
	erb :front_page
end

# This will be for showing the form to create new stories
get '/new' do
	erb :story_new
end

get '/:id' do 
  @story = Story.new(params[:body])
  erb :show_story
end

get '/:id/edit' do
  @story = Story.find(params[:id])
  erb :story_edit
end



post '/create' do 
  Story.create(title: params[:title], 
                       link: params[:link], 
                       body: params[:body])
  redirect '/'
end

post '/:id/update' do 
  @story = Story.update(params[:id],
                        title: params[:title],
                        link: params[:link],
                        body: params[:body])

  redirect "/"
end

	# @story = Story.find(params[:id])














