require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development? 
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql', database: 'hacknews', host: 'localhost'}

class Post < ActiveRecord::Base
end

Post.create(title: 'Dog Lasers', link: 'http://theonion.com', body: 'Words words words.', up_votes: 0, down_votes: 0)



