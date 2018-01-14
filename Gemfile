# frozen_string_literal: true

ruby '2.4.3'

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'

gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap'
gem 'bootstrap3-datetimepicker-rails'
gem 'bootstrap_form', github: 'bootstrap-ruby/rails-bootstrap-forms'
gem 'chosen-rails'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'momentjs-rails'
gem 'pg', '~> 0.18'
gem 'popper_js'
gem 'puma', '~> 3.7'
gem 'rails-i18n'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'therubyracer', platforms: :ruby
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'rubocop'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'minitest-rails'
  gem 'minitest-reporters'
  gem 'simplecov', require: false
  gem 'timecop'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
