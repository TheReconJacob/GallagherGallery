require_relative "./server.rb"

run Server.new

#res = client.photos(q: "yellow flower", safesearch: true, page: 1, per_page: 30)
#res["total"] # 15526
#res["totalHits"] # 500
#res["hits"] # pictures