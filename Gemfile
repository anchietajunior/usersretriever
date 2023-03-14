source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

gem "rails", "~> 7.0.4"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "view_component"
gem "jbuilder"
gem "redis"
gem "sidekiq", "~> 6.5"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rubocop-rails", require: false
  gem "simplecov", require: false
end

group :development do
  gem "solargraph"
end

group :test do
  gem "rspec-rails", "~> 5.0.0"
  gem "rails-controller-testing"
  gem "database_cleaner-active_record"
  gem "factory_bot_rails", "~> 4.11"
  gem "ffaker", "~> 2.7.0"
  gem "rspec-sidekiq"
  gem "shoulda-matchers", "~> 5.0.0"
  gem "vcr"
  gem "webmock", "~> 3.6.0"
end

group :development do
  gem "web-console"
end

