# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'sinatra/auth/oauthed/version'

Gem::Specification.new do |s|
  s.name        = 'sinatra_auth_oauthed'
  s.version     = Sinatra::Auth::Oauthed::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Seth Herr', 'David Jaress']
  s.homepage    = 'http://github.com/zensaburou/sinatra_auth_oauthed'
  s.summary     = 'A sinatra extension for easy oauth integration with oauth providers'
  s.license     = 'MIT'
  s.description = s.summary

  s.add_dependency 'sinatra',       '~>1.0'
  s.add_dependency 'warden-oauthed', '~>0.0.0'

  s.add_development_dependency 'rake', '~> 10.4', '>=10.4.2'
  s.add_development_dependency 'rspec', '~>2.4', '>=2.4.0'
  s.add_development_dependency 'shotgun', '~> 0.9', '>=0.9.1'
  s.add_development_dependency 'randexp', '~>0.1.5'
  s.add_development_dependency 'rack-test', '~>0.5.3'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
