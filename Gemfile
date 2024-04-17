source "https://rubygems.org"

ruby "3.2.2"
gem "rails", "~> 7.1.3"

gem "bootstrap"
gem "devise"
gem "importmap-rails"
gem "sprockets-rails"
gem "sassc-rails"
gem 'pg'
gem "puma", ">= 5.0"

gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'factory_bot_rails'
  gem "rspec-rails"
end

group :development do
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'simplecov', require: false
end
