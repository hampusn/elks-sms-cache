# Sms Controller

require 'sinatra/json'

include Hampusn::ElksSmsCache::Models

module Hampusn
  module ElksSmsCache
    module Controllers
      class SmsController < Sinatra::Base

        use Rack::Auth::Basic, "Protected Area" do |user, pass|
          user2 = ENV['BASIC_AUTH_USER'] || 'devuser'
          pass2 = ENV['BASIC_AUTH_PASS'] || 'devpass'

          user == user2 && pass == pass2
        end

        # Helper function to check if a channel has been passed or not.
        def channel_exists?
          return !!params[:channel]
        end

        # Get sms
        get "/sms" do
          # Make sure a channel has been requested
          halt 400 unless channel_exists?
          # Default to 10
          n = params[:n] || 10
          # Max 20 sms
          n = [n.to_i, 20].min
          # Channel param
          channel = params[:channel]

          sms = Sms.where(channel: channel).order(created_at: :desc).limit(n)

          json :status => "success", :items => sms
        end

        # Store sms
        post "/sms" do
          # Make sure a channel has been requested
          halt 400 unless channel_exists?

          sms = Sms.new

          sms.channel = params[:channel]
          sms.from = params[:from]
          sms.to = params[:to]
          sms.message = params[:message]

          sms.save
        end

      end
    end
  end
end