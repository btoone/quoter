require 'sinatra'
require 'mongo'
require 'uri'

configure do
    uri = URI.parse(ENV['MONGOHQ_URL'])
    # you don't need to specify auth because it's already in the env var
    conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])    
    db = conn.db(uri.path.gsub(/^\//, ''))
    
    # access a specific collection
    set :db, db
    set :coll, db.collection("your_collection")
end

get '/collections/?' do
  settings.db.collection_names
end

get '/' do
  @time = Time.now
  haml :index
  # or if you want to use erb templates
  # erb :index
end

# To use inline templates uncomment and put code in the templates
# (@@template) below

# __END__
#
# @@layout
# <!-- add template code here -->
#
# @@index
# <!-- add template code here -->
