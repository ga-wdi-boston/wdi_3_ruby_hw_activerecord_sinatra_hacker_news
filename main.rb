require 'pg'
require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

class Story < ActiveRecord::Base
end

get '/' do
  @stories = Story.all 
  erb :story_index
end