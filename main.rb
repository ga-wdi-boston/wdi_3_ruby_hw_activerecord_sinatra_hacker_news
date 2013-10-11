require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
                database: 'stories_db',
                host: 'localhost'}

class Story < ActiveRecord::Base
end

# link for main page
get '/' do
  @stories = Story.all
  erb :story_index
end




# action to delete specific post
post '/:id/delete' do 
Story.find(params[:id]).delete
  redirect '/'
end

get '/new' do
  erb :story_new
end

# action to create page
post '/create' do
  Story.create(title: params[:title], author: params[:author], body: params[:body], up_votes: params[:up_votes], down_votes: params[:down_votes])
  redirect "/"
end

get '/:id/edit' do
  # get the story you want to update/edit
  @story = Story.find(params[:id])
  # render the form to edit/update this story
  erb :story_edit
end

# action to update specific page
post '/:id/update' do
Story.update(params[:id], title: params[:title], author: params[:author], body: params[:body], up_votes: params[:up_votes], down_votes: params[:down_votes])
  redirect "/"
end

get '/:id' do
  #  @story = Story.find(params[:id])
  @stories = Story.find(params[:id])
  erb :story_show
end


################

# # link to edit specific page
# get '/post/:id/edit' do
#   @posts = Post.find(params[:id])
#   erb :post_edit
# end

# # action to delete specific post
# post '/post/:id/delete' do 
# Post.find(params[:id]).delete
#   redirect '/posts'
# end

# # link for new post form
# get '/post/new' do
#   erb :post_new
# end
#############################################
# # link for individual posts
# get '/post/:id' do
#   @posts = Post.find(params[:id])
#   erb :post_show
# end

# # action to create page
# post '/post/create' do
#   Post.create(author_name: params[:author_name], body: params[:body], image_url: params[:image_url])
#   redirect "/posts"
# end

# # action to update specific page
# post '/post/:id/update' do
# Post.update(params[:id], :body => params[:body], :author_name => params[:author_name], :image_url => params[:image_url])
#   redirect "/posts"
# end