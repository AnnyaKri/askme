source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "email_validator"
gem "font-awesome-rails"
gem "gravtastic"
gem "importmap-rails"
gem "jbuilder"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "sprockets-rails"
gem "stimulus-rails"
gem 'where_exists'
gem "turbo-rails"
gem "puma", "~> 5.0"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "web-console"
  gem "sqlite3", "~> 1.4"
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :production do
  gem "pg"
end
