source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.0'
gem 'jquery-rails'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.1.1'
gem 'react-rails'
gem 'semantic-ui-sass', git: 'https://github.com/doabit/semantic-ui-sass.git'
gem 'slim'
gem 'sqlite3'
gem 'therubyracer', platforms: :ruby
gem 'uglifier', '>= 1.3.0'

gem 'prawn'
gem 'prawn-table'

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
end

