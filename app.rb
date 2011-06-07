require 'sinatra'
require 'mongo'
require 'yaml'

configure do
  # p ENV['RACK_ENV']
  # p settings.environment
  # config = YAML::load(File.read('config/database.yml'))
  # 
  # db = Mongo::Connection.new(config['heroku']['host'], config['heroku']['port']).db(config['heroku']['database'])
  # auth = db.authenticate(config['heroku']['username'], config['heroku']['password'])
  # set :mongo_db, db
  
  # # new to ruby
  # db = Mongo::Connection.new("mongohq-url", port).db("database")
  # auth = db.authenticate("username", "password")
  # coll = db.collection("emails")
  #  
  # # sinatra-book-contrib
  # conn = Mongo::Connection.new("localhost", 27017).db
  # set :mongo_connection, conn
  # set :mongo_db,         conn.db('test')
  #  
  # # sinatra_mongo_base
  # db = Mongo::Connection.new("flame.mongohq.com", 27020).db("your_database")
  # auth = db.authenticate("your_user", "your_password")
  # coll = db.collection("your_collection")

  # mongodb://fred:foobar@localhost/baz
  # mongodb://heroku:6da6skmzn3ymi9kqmnsixg@flame.mongohq.com:27107/app554007
  # mongodb://[username:password@]host1[:port1][,host2[:port2],...[,hostN[:portN]]][/[database][?options]]
  
  # specify env variable on command line for development; production uses vars listed in heroku config
  uri = URI.parse(ENV['MONGOHQ_URL'])
  # you don't need to specify auth because it's already in the env var
  conn = Mongo::Connection.from_uri(ENV['MONGOHQ_URL'])
  db = conn.db(uri.path.gsub(/^\//, ''))
  
  # access a specific collection
  set :db, db
  # set :coll, db.collection("your_collection")
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
