# frozen_string_literal: true

ruby File.read('.ruby-version').chomp.sub('ruby-', '')

source 'https://rubygems.org'

gem 'rails', '~> 5.2.3'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap'
gem 'bootstrap'
gem 'bootstrap3-datetimepicker-rails'
gem 'bootstrap_form'
gem 'chosen-rails'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mini_racer', platforms: :ruby
gem 'momentjs-rails'
gem 'pg', '~> 0.18'
gem 'popper_js'
gem 'puma', '~> 3.7'
gem 'rails-i18n'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'sysinfo'
gem 'turbolinks', '~> 5'
gem 'uglifier', '<4'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
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
