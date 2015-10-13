# encoding: utf-8
ENV['RACK_ENV'] ||= 'development'

require File.expand_path('../config/app.rb', __FILE__)
use Rack::Static, urls: ['/public'], root: 'public'

run Example::App
