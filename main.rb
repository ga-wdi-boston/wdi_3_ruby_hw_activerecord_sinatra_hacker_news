require 'pry'
require 'pg'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, {adapter: 'postgresql',
				database: 'ga-lab-posts',
				host: 'localhost'}

class Newslink < ActiveRecord::Base
  has_many :comments
end

class Comment < ActiveRecord::Base
end

# Newslink.create(title: "Release of Wikileaks internal memo", link: "http://wikileaks.org/IMG/html/wikileaks-dreamworks-memo.html")
# Newslink.create(title: "Millions in Asia still on Windows XP", link: "http://visual.ly/millions-asia-still-windows-xp")
# Newslink.create(title: "Demands on Lavabit violated fourth amendment", link: "http://www.theguardian.com/technology/2013/oct/11/fbi-demands-lavabit-violated-fourth-amendment-levison")
# Newslink.create(title: "Iconic: Advanced Icons for the Modern Web", link: "http://useiconic.com/")
# Newslink.create(title: "Schneier on Security", link: "https://www.schneier.com/blog/archives/2013/10/air_gaps.html")

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

get '/newslink/:id/delete' do
  Newslink.delete(params[:id])
  redirect '/newslink/'
end

post '/newslink/:id/add-comment' do
  Comment.create(author: params[:author], body: params[:body], newslink_id: params[:id])
  redirect "/newslink/#{params[:id]}"
end

post '/newslink/:id/update' do
  updated = Newslink.find(params[:id])
  updated.title = params[:title]
  updated.link = params[:link]
  updated.body = params[:body]
  updated.save
  redirect "/newslink/"
end

get '/newslink/:id/flag' do
  flagged_post = Newslink.find(params[:id])
  flagged_post.flagged = true
  flagged_post.save
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

post '/newslink/:newslink_id/:comment_id/update-comment' do
  comment = Comment.find(params[:comment_id])
  comment.update(author: params[:author], body: params[:body])
  redirect "/newslink/#{params[:newslink_id]}"
end

get '/newslink/:newslink_id/:comment_id/edit-comment' do
  @comment = Comment.find(params[:comment_id])
  erb :comment_edit
end

get '/newslink/:newslink_id/:comment_id/delete-comment' do
  Comment.delete(params[:comment_id])
  redirect "/newslink/#{params[:newslink_id]}"
end

