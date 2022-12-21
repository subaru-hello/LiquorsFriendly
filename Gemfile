# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.2.2'
gem 'cells-erb'
gem 'cells-rails'
gem 'devise'
gem 'importmap-rails'
gem 'jbuilder'
gem 'jquery-rails'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rails', '~> 7.0.4'
gem 'sassc-rails'
gem 'simple_calendar', '~> 2.4'
gem 'sprockets-rails'
gem 'sqlite3', '~> 1.4'
gem 'stimulus-rails'
gem 'tailwindcss-rails', '~> 2.0'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'annotate'
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'shoulda-matchers', '~> 5.0'
end

group :development do
  gem 'erbcop'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'web-console'
end

group :test do
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'factory_bot_rails'
gem 'faker'
gem 'faker-japanese'
