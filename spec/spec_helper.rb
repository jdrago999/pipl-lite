# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'simplecov'
SimpleCov.start do
  add_filter 'spec/'
end
SimpleCov.minimum_coverage 100
require File.expand_path("../../lib/pipl-lite", __FILE__)
require 'rspec'
require 'shoulda-matchers'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
  end
end
