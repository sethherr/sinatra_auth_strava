# encoding: utf-8
ENV['RACK_ENV'] ||= 'development'

require File.expand_path('../lib/sinatra_auth_oauthed.rb', __FILE__)
require File.expand_path('../spec/app.rb', __FILE__)

run Example::App
