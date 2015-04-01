# encoding: utf-8

$:.push File.expand_path('../lib', __FILE__)
require 'jsx/version'

Gem::Specification.new do |s|
  s.name        = 'jsx'
  s.version     = JSX::VERSION
  s.summary     = "Ruby wrapper for Facebook's JSX transformer"
  s.description = "Transform JSX to JavaScript from Ruby. Includes a Tilt template for use with Sinatra (or any Tilt project)."
  s.homepage    = 'https://github.com/rmosolgo/jsx-ruby'
  s.license     = 'MIT'
  s.files       = Dir['lib/**/*','README.md','LICENSE']

  s.author      = ['Robert Mosolgo']
  s.email       = ['rdmosolgo@gmail.com']

  s.add_dependency 'execjs'
  s.add_dependency 'react-source', '~> 0.13'
  s.add_dependency 'tilt'

  s.add_development_dependency "pry", "~> 0.10"
  s.add_development_dependency "guard", "~> 2.12"
  s.add_development_dependency "guard-bundler", "~> 2.1"
  s.add_development_dependency "guard-minitest", "~> 2.4"
  s.add_development_dependency "minitest", "~> 5.5"
  s.add_development_dependency "minitest-focus", "~> 1.1"
  s.add_development_dependency "minitest-reporters", "~>1.0"
  s.add_development_dependency "rake", "~> 10.4"
end
