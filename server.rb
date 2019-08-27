require 'sinatra'
require 'net/http'
require 'uri'
require 'json'
require 'pixabay'

Pixabay.configure do |config|
    config.key = ENV['PIXABAY_KEY']
    config.timeout = 10
end
# client = Pixabay.new
# res = client.photos(q: "yellow flower", safesearch: true, page: 1, per_page: 30)
# res["total"] # 15526
# res["totalHits"] # 500
# res["hits"] # pictures
class Server < Sinatra::Base
    set :pixabay, Pixabay.new

    get '/' do
        results = settings.pixabay.photos(q: "Oasis", safesearch: true, page: 1, per_page: 30)
        erb :index, :locals => {photos: results["hits"].map {|photo| photo["webformatURL"]}, users: results["hits"].map {|user| user["user"]}, photolinks: results["hits"].map {|photolink| photolink["pageURL"]}}
    end
end
