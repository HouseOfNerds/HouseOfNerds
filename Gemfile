# frozen_string_literal: true

ruby File.read('.ruby-version').chomp.sub('ruby-', '')

source 'https://rubygems.org'

gem 'rails', '~> 5.2.3'

gem 'bcrypt'
gem 'bootsnap'
gem 'bootstrap'
gem 'bootstrap3-datetimepicker-rails'
gem 'bootstrap_form'
gem 'chosen-rails'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'mini_racer', platforms: :ruby
gem 'momentjs-rails'
gem 'pg'
gem 'popper_js'
gem 'puma'
gem 'rails-i18n'
gem 'sass-rails'
gem 'slim-rails'
gem 'turbolinks'
gem 'uglifier'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
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
