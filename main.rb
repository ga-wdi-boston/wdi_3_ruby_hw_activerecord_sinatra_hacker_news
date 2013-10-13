require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'sinatra/activerecord'

# Define the connection to the database
set :database, {adapter: 'postgresql',
								database: 'danhacker',
								host: 'localhost'}


# Define the object classes for the datbases
class Story < ActiveRecord::Base
  has_many :comments
end 

class Comment < ActiveRecord::Base
  belongs_to :stories
end 


# This is for showing all stories
get '/' do
	@stories = Story.all
	erb :front_page
end

# This is for showing the form to create new stories
get '/new' do
	erb :story_new
end

# This is for showing a  indivudual story and related comments
get '/:id' do 
  @story = Story.find(params[:id])
  erb :show_story
end

# This is for editing a story
get '/:id/edit' do
  @story = Story.find(params[:id])
  erb :story_edit
end


# This is for posting a new story to the database
post '/create' do 
  Story.create(title: params[:title], 
                       link: params[:link], 
                       body: params[:body])
  redirect '/'
end

# This is for updating a story in the databae
post '/:id/update' do 
  @story = Story.update(params[:id],
                        title: params[:title],
                        link: params[:link],
                        body: params[:body])

  redirect "/"
end















