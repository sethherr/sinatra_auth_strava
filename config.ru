ENV['RACK_ENV'] ||= 'development'
require 'bundler'
require 'bundler/setup'

$LOAD_PATH << File.dirname(__FILE__) + '/lib'
require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'sinatra_auth_oauthed'))
require File.expand_path(File.join(File.dirname(__FILE__), 'spec', 'app'))

run Example::App
