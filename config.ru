require 'bundler'

Bundler.require

require 'app.rb'

# set variables here like :environment, :run, :root, or :views
# see http://www.sinatrarb.com/intro#Available%20Settings for
# more variables

run Sinatra::Application
