source 'https://rubygems.org'
gem 'rails', '3.2.9'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'


#gem "database_cleaner", ">= 0.9.1", :group => :test
#gem "email_spec", ">= 1.4.0", :group => :test
#gem "cucumber-rails", ">= 1.3.0", :group => :test, :require => false
#gem "launchy", ">= 2.1.2", :group => :test
#gem "capybara", ">= 1.1.3", :group => :test
gem "rspec-rails", ">= 2.11.4", :group => [:development, :test]
gem "less-rails", ">= 2.2.6", :group => :assets
gem "twitter-bootstrap-rails", ">= 2.1.6", :group => :assets
gem "therubyracer", ">= 0.10.2", :group => :assets, :platform => :ruby

gem 'devise'
gem 'simple_form'
gem 'nested_scaffold'
gem 'rmagick'
gem 'paperclip'
gem 'yaml_db'
gem 'omniauth-facebook'
group :production do
	gem 'pg'
	gem "thin", ">= 1.5.0"
end

group :development do
	gem 'sqlite3'
	gem "quiet_assets", ">= 1.0.1"
end