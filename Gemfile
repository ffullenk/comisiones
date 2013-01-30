source 'https://rubygems.org'
gem 'rails'

group :assets do

  gem "less-rails"
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem "twitter-bootstrap-rails"

#gem "database_cleaner", ">= 0.9.1", :group => :test
#gem "email_spec", ">= 1.4.0", :group => :test
#gem "cucumber-rails", ">= 1.3.0", :group => :test, :require => false
#gem "launchy", ">= 2.1.2", :group => :test
#gem "capybara", ">= 1.1.3", :group => :test
gem "rspec-rails", ">= 2.11.4", :group => [:development, :test]


gem 'devise'
gem 'simple_form'
gem 'nested_scaffold'
gem 'rmagick'
gem 'paperclip'
gem 'yaml_db'
gem 'omniauth-facebook'
gem "paperclip-dropbox"
gem 'thin'
group :production do
	gem 'pg'
	
end

group :development do
	gem 'sqlite3'
	gem 'quiet_assets'
	gem "therubyracer", ">= 0.10.2", :platform => :ruby
end