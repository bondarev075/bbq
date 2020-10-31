source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'

gem 'dotenv-rails', require: 'dotenv/rails-now'

gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'

gem 'puma', '~> 4.1'
gem 'webpacker', '~> 5.0'
gem 'bootsnap', '>= 1.4.2', require: false

gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  gem 'pry-rails'
  gem "letter_opener"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'

  gem 'capistrano', '~> 3.14.1'
  gem 'capistrano-rails', '~> 1.6.1'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-bundler', '~> 2.0.1'
end

group :production do
  gem 'pg'
end
