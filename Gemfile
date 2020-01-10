# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "bootsnap", ">= 1.4.2", require: false
gem "jbuilder", "~> 2.7"
gem "mini_magick"
gem "mysql2", ">= 0.4.4"
gem "pdfkit"
gem "puma", "~> 3.12"
gem "rails", "~> 6.0.0"
gem "sass-rails", "~> 5"
gem "to_bool"
gem "turbolinks", "~> 5"
gem "webpacker"
gem "wkhtmltopdf-binary-edge", "~> 0.12.4.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "spring-commands-rspec"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rubocop", "~> 0.71.0", require: false
  gem "rubocop-github"
  gem "rubocop-rails"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
