source 'http://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'activerecord-postgres-hstore'
gem 'gmaps4rails'

# Gems used only for assets and not required in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'eco'
end

gem 'simple_form', '~> 2.0'
gem 'client_side_validations', '~> 3.2.0'
gem 'client_side_validations-simple_form', '~> 2.0.0'

#gem 'table-for'
#gem 'table_cloth'
gem 'table_for_collection'
gem 'mobile-fu'

#gem 'rails3-jquery-autocomplete'
gem 'kaminari', '~> 0.13.0'
gem 'friendly_id', '~> 4.0.9'
gem 'socialization'
gem 'twitter-text'

#File uploading
#gem 'carrierwave-mongoid', require: 'carrierwave/mongoid'
gem 'carrierwave'
gem 'mini_magick'
gem 'cloudinary'

gem 'sorcery'
gem 'cancan'
gem 'rolify'
gem 'wicked'
gem 'resque', require: "resque/server"
gem 'savon'
gem 'whenever', require: false
gem 'tire'
#PDF
gem 'prawn'

gem 'exception_notification'

gem 'jquery-rails'
gem 'execjs'
gem 'therubyracer'
gem 'select2-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

gem 'jbuilder'

# Use unicorn as the web server
gem 'unicorn'
#gem 'thin'

# Deploy with Capistrano
gem 'capistrano'
#gem 'capistrano-rbenv'

#gem 'blogger', git: "https://github.com/farukca/blogger.git", ref: "81f76e19a436de8008a2dd4f4f087b4cb36dd322"
gem 'blogger', path: "../blogger"
#gem 'assetim', git: "https://github.com/farukca/assetim.git", ref: "d6fb39ab922b40cfb6920a4eb087c0f8eb805397"
gem 'assetim', path: "../assetim"
#gem 'helpdesk', git: "https://github.com/farukca/helpdesk.git", ref: "9e2d5f083a2c0a06b2efe8a3e56ac61beec6e12e"
gem 'helpdesk', path: "../helpdesk"

group :test do
  # Pretty printed test output
  #gem 'mongoid-rspec'
  #gem 'guard-rspec'
  gem 'minitest'
  gem 'turn', require: false
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'fakeweb'
  gem 'simplecov', require: false
end
group :development do
  gem 'meta_request', '0.2.0'
  gem 'ruby-debug19'
#  gem 'bullet'
end
#gem 'rack-mini-profiler'