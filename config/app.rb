ENV["RACK_ENV"] ||= "development"

require 'rubygems' unless defined?(Gem)
require 'bundler'
Bundler.require(:default, ENV["RACK_ENV"].to_sym)
require 'sinatra/asset_pipeline'
require 'dotenv'
Dotenv.load

module Example
end

require './config/routes.rb'
