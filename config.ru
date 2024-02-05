# executer rackup => bundle exec rackup (dans le terminal)
# executer rerun rackup => bundle exec rerun rackup

require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require './lib/controller'
run ApplicationController