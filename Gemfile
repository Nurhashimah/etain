source 'https://rubygems.org'
#ruby '2.1.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
gem "devise", "~> 3.2.4"
gem 'pg', '~> 0.17.1'
# Use unicorn as the app server
gem 'unicorn'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '~> 2.1.1'  # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.1'  # Use CoffeeScript for .js.coffee assets and views
gem "jquery-rails", "~> 3.1.0"  # Use jquery as the JavaScript library
gem 'jbuilder', '~> 1.2'  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'haml',         '~> 4.0.6'
gem 'haml-rails',   '~> 0.9.0'
gem "font-awesome-rails", "~> 4.0.3.1"
gem "bootstrap-datepicker-rails", "~> 1.3.0.1"
gem "bootstrap-select-rails", "~> 1.3.0.1"
gem 'modernizr-rails', '~> 2.7.1'


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

group :development, :test do
  gem "thin", "~> 1.6.2"
  gem 'quiet_assets', '~> 1.0.2'
  #gem "rspec-rails", "~> 2.14.0"  # a=http://stackoverflow.com/questions/28046509/error-could-not-load-guard-rspec-or-find-class-guardrspec
  #gem "rspec-rails", "~> 3.3.2" #https://github.com/projecthydra/sufia/issues/1639
  gem "rspec-rails", "~> 3.4.2"
  #gem 'guard-rspec', "~> 2.5.0" # refer a
  gem 'guard-rspec', "~>4.6.0"
  gem 'capistrano'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
end

group :test do
  gem "selenium-webdriver", "~> 2.35.1"
  gem "capybara", "~> 2.1.0"
  gem 'growl', '1.0.3'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
