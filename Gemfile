source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'devise'
gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem "paperclip"
gem "carrierwave", "~> 1.0"
gem "simple_form"
gem "bootstrap-sass", "3.3.6"
gem "kaminari"
gem "ransack"
gem "bootstrap-kaminari-views"
gem "jquery-ui-rails"
gem "social-share-button"
gem "will_paginate"
gem "owlcarousel-rails"
gem "acts_as_votable", "~> 0.10.0"
gem "acts-as-taggable-on"
gem "rails-jquery-autocomplete"
gem "config"
gem "omniauth"
gem "omniauth-twitter"
gem "omniauth-facebook"
gem "omniauth-instagram"
gem "i18n-js"
gem 'rails-assets-sweetalert2', '~> 5.1.1', source: 'https://rails-assets.org'
gem 'sweet-alert2-rails'
gem "mini_magick"
gem "font-awesome-rails"


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem "faker"
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'sqlite3'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem "pg"
  gem 'rails_12factor'
end
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "gravatar_image_tag"
source "https://rails-assets.org" do
  gem "rails-assets-chosen"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
