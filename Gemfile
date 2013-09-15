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

#gem 'sorcery'
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

#gem 'nimbos', git: "https://github.com/farukca/nimbos.git", ref: "2cadb6f041b4e9b8edb969f5f4e1a169c4501c06"
gem 'nimbos', path: "../nimbos"
gem 'personal', path: "../personal"
#gem 'blogger', git: "https://github.com/farukca/blogger.git", ref: "ff08d3632e75889ca0399fb31c026d5f3ffaddf9"
gem 'blogger', path: "../blogger"
#gem 'assetim', git: "https://github.com/farukca/assetim.git", ref: "899299ee88eb2af42e10ab5a4a0a7d78697d0ba8"
gem 'assetim', path: "../assetim"
#gem 'helpdesk', git: "https://github.com/farukca/helpdesk.git", ref: "2d73c704d9d02672288ec952b847a0dcc7762de1"
gem 'helpdesk', path: "../helpdesk"
gem 'logistics', path: "../logistics"

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