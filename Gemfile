source "https://rubygems.org"

ruby "2.2.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 4.2.5.1"
# Use postgresql as the database for Active Record
gem "pg"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"

# Use jquery as the JavaScript library
gem "jquery-rails"

# Twitter API
gem "twitter", "~> 5.14.0"

gem "twitter-bootstrap-rails"

# Env variables
gem "dotenv-rails", "~> 2.0.2", groups: [:development, :test]

# Images
gem "carrierwave", "~> 0.10.0"
gem "carrierwave-aws"
gem "fog"

gem "mini_magick"

# Use ActiveModel has_secure_password
# gem "bcrypt", "~> 3.1.7"

# Use Unicorn as the app server
# gem "unicorn"
gem "sidekiq", "~> 3.4.2"

gem "thin"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

group :development, :test do
  # Call "byebug" anywhere in the code to stop execution and get a debugger console
  gem "byebug"
end

group :development do
  gem "foreman"
  gem "bullet"
  gem "rack-livereload"
  gem "guard-livereload", "~> 2.4", require: false
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem "web-console", "~> 2.0"
end

group :production do
  gem "uglifier", "~> 2.7.2"
  gem "rails_12factor"
end

group :test do
  gem "simplecov", require: false
  gem "factory_girl_rails", "4.5.0"
  gem "rspec-rails", "~> 3.3.3"
  gem "webmock"
  gem "vcr"
end
