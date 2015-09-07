require 'sinatra/base'
require 'sinatra/activerecord'
require 'dotenv'

# Load configuration file (.env)
Dotenv.load

Dir.glob("models/*.rb").each { |r| require_relative r }
Dir.glob("controllers/*.rb").each { |r| require_relative r }

module Hampusn
  module ElksSmsCache
    class App < Sinatra::Base

      use Hampusn::ElksSmsCache::Controllers::SmsController

      get "/" do
        "46Elks Sms Cache"
      end


      # Boot it up!
      run! if __FILE__ == $0
    end
  end
end
