# Gems required
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'sinatra/activerecord'

# Define the connection to the database via Activerecord
set :database, {adapter: 'postgresql',
  database: 'danhacker',
  host: 'localhost'}


# Define the object classes for the databases
class Story < ActiveRecord::Base
  has_many :comments
end 

class Comment < ActiveRecord::Base
  belongs_to :stories
end 


# This is for showing all stories
get '/' do
  @stories = Story.all.order("created_at DESC")
  erb :front_page
end

# This is for showing the form to create new stories
get '/new' do
  erb :story_new
end

# This is for showing an indivudual story and related comments
get '/:id' do 
  @story = Story.find(params[:id])
  erb :story_show
end

# This is for editing a story
get '/:id/edit' do
  @story = Story.find(params[:id])
  erb :story_edit
end

# This is for deleting a story

post '/:id/delete' do
  Story.find(params[:id]).destroy
  redirect '/'
end


# This is for posting a new story to the database
post '/create' do 
  Story.create(title: params[:title],
    author: params[:author], 
    link: params[:link], 
    body: params[:body])
  redirect '/'
end

# This is for updating a story in the databae
post '/:id/update' do 
  @story = Story.update(params[:id],
    author: params[:author],
    title: params[:title],
    link: params[:link],
    body: params[:body])
  redirect "/"
end

# The following two posts are for up or down voting
post '/:id/up_votes' do
  upvoted = Story.find(params[:id])
  upvoted[:up_votes] += 1
  upvoted.save
  redirect "/"
end

post '/:id/down_votes' do
  downvoted = Story.find(params[:id])
  downvoted[:down_votes] += 1
  downvoted.save
  redirect "/"
end
