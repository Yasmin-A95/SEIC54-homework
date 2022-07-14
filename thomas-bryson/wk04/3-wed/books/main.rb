require 'sinatra'
require 'sinatra/reloader'
require 'httparty'

get '/' do
   erb :home
end

get '/info' do
   book_url = "https://www.googleapis.com/books/v1/volumes?q=title#{ params[:book_name] }"
   @info = HTTParty.get book_url;
   print @info["kind"]
#    print info["items"][1]["volumeInfo"].keys
   erb :info
end