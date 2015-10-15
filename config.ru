ENV['APPLICATION_CLIENT_ID'] = 'dddc188f84e348ddae69f17dd63e758ded4cc24abed435a53db9525db2cd7af45f0'
ENV['APPLICATION_CLIENT_SECRET'] = 'e35b8e02901a3ca1b5b1e0c4cf3e1e6dbd1855de4684bd95175721428816ae96'
ENV['APPLICATION_SCOPES_REQUESTED'] = 'public'
ENV['OAUTH_BASE_URL'] = 'http://localhost:3000'
ENV['SESSION_KEY'] = 'Set a key'
ENV['USER_ATTRIBUTES'] = 'id full_name email'
ENV['RACK_ENV'] = 'test'

ENV['RACK_ENV'] ||= 'development'
require 'bundler'
require 'bundler/setup'

$LOAD_PATH << File.dirname(__FILE__) + '/lib'
require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'sinatra_auth_oauthed'))
require File.expand_path(File.join(File.dirname(__FILE__), 'spec', 'app'))

run Example::App
