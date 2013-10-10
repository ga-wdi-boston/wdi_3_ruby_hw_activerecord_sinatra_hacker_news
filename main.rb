require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require 'rake'

set :database, {adapter:'postgresql',
  				database: 'ga-class-posts',
  				host: 'localhost'}

class Post < ActiveRecord::Base
end  

get '/' do 
'Hello'
	
end