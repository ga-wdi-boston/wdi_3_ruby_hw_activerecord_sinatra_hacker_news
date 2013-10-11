require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
				database: 'ga-lab-posts',
				host: 'localhost'}

class Newslink < ActiveRecord::Base
end

Newslink.create(title: "Hermione Granger Loses it", link: "https://github.com/zdavison/NSString-Ruby")
Newslink.create(title: "Azerbaijian Election Results", link: "http://business.financialpost.com/2013/10/10/")


get '/newslink/' do 
  @newslinks = Newslink.order("(up_votes - down_votes) DESC")
  erb :index
end

get '/newslink/submit' do
	erb :post_new
end

get '/newslink/recent' do
	@newslinks = Newslink.order("updated_at DESC")
	erb :index
end

post '/newslink/new' do
  Newslink.create(title: params[:title], link: params[:link], body: params[:body])
  redirect '/newslink/'
end

get '/newslink/:id' do
  @newslink = Newslink.find(params[:id])
  erb :post_show
end

get '/newslink/:id/edit' do
  @newslink = Newslink.find(params[:id])
  erb :post_edit
end

post '/newslink/:id/delete' do
  Newslink.delete(params[:id])
  redirect '/newslink/'
end

post '/newslink/:id/update' do
  updated = Newslink.find(params[:id])
  updated.title = params[:title]
  updated.link = params[:link]
  updated.body = params[:body]
  updated.save
  redirect "/newslink/"
end

post '/newslink/:id/up_vote' do
  upvoted = Newslink.find(params[:id])
  upvoted.up_votes += 1
  upvoted.save
  redirect "/newslink/"
end


post '/newslink/:id/down_vote' do
  downvoted = Newslink.find(params[:id])
  downvoted.down_votes += 1
  downvoted.save
  redirect "/newslink/"
end

