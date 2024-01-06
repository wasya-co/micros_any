source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

gem 'rails', '~> 6.1.0'
gem 'puma', '~> 5.0'
gem 'sass-rails'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'

gem 'mongoid',           '~> 7.3.0'
gem 'mongoid_paranoia',  '~> 0.6.0'
gem 'mongoid-autoinc',   '~> 6.0.3'
gem 'mongoid-paperclip', '~> 0.1.0'
gem 'kaminari-mongoid',  '~> 1.0.1'

gem 'devise',                         "~> 4.9.3"
gem "omniauth-keycloak",              "~> 1.5.1"
gem "omniauth-rails_csrf_protection", "~> 1.0.1" # required by wco_email, by keycloak to be in the host app.
# gem 'keycloak',                       "~> 3.0.0"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'wco_models', github: 'wasya-co/wco_models',   branch: '3.1.0'
gem 'wco_email',  github: 'wasya-co/wco_email_rb', branch: '0.0.0'

group :development, :test do
  gem 'byebug'

  gem 'capybara'

  gem 'rspec-rails'

  gem 'selenium-webdriver', "~> 4.9.0"

  ## From: https://stackoverflow.com/questions/24004728/getting-selenium-webdriver-to-use-chrome-in-rspec-rails
  # gem 'chromedriver-helper'

  gem 'irb', '>= 1.2.8'
end

group :development do
  gem 'capistrano'

  ## https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'

  gem 'web-console', '>= 4.1.0'
end

