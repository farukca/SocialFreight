source 'http://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'
#gem 'mongoid', '~> 2.2'
#gem 'bson_ext', '~> 1.3'
#gem 'mongoid_token', '~> 0.9.1'
#gem 'mongoid_slug'
#gem 'mongoid_auto_inc'
#gem 'mongoid_spacial'
#gem 'mongoid_follow'
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

gem 'blogger', git: "git@github.com:farukca/blogger.git", ref: "fdf276889a75f743ed9ef41622fd7d881013c57a"
#gem 'blogger', path: "../blogger"
gem 'assetim', git: "git@github.com/farukca/assetim.git", ref: "c5124e2d3cb0254e1291388b122c55cda46091e0"
#gem 'assetim', path: "../assetim"
gem 'helpdesk', git: "git@github.com/farukca/helpdesk.git", ref: "8a72119fb5f62957d9dd289e5589ff76bfc1eb9d"
#gem 'helpdesk', path: "../helpdesk"

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