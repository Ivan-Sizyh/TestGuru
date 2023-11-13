source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.0.8'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'

gem 'sprockets-rails', '~> 3.4'
gem 'jsbundling-rails', '~> 1.0'
gem 'cssbundling-rails', '~> 1.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bcrypt", "~> 3.1.7"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Use Sass to process CSS
gem "sassc-rails"

gem 'activerecord-import', '~> 1.2'
gem 'blueprinter', '~> 0.25'
gem 'caxlsx', '~> 3.1'
gem 'caxlsx_rails', '~> 0.6'
gem 'dotenv-rails', '~> 2.7'
gem 'draper', '~> 4.0'
gem 'i18n-tasks', '~> 0.9.34'
gem 'pagy', '~> 5.0'
gem 'pundit', '~> 2.1'
gem 'rails-i18n', '~> 7'
gem 'rubyXL', '~> 3.4'
gem 'rubyzip', '~> 2'
gem 'sidekiq', '~> 6'
gem 'lokalise_rails', '7.0.0'
gem 'faraday-retry'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

#AUTH

gem 'devise', '~> 4.0'

# NETWORKING

gem 'octokit'

# UI

gem 'bootstrap', '~> 5.1.3'
gem 'octicons_helper'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker', '~> 2'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'letter_opener'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'rubocop', '~> 1.18', require: false
  gem 'rubocop-i18n', '~> 3', require: false
  gem 'rubocop-performance', '~> 1.11', require: false
  gem 'rubocop-rails', '~> 2.11', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
