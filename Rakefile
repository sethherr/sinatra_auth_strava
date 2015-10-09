task :default => [:spec]
require 'rspec/core/rake_task'
require 'dotenv/tasks'

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

require 'sinatra/asset_pipeline/task'
require './config/app'

Sinatra::AssetPipeline::Task.define! Example::App