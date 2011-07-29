source 'http://rubygems.org'

gem 'rails', '3.1.0.rc5'

#deploy packager to create .war files
gem 'warbler'

#rails 3.1 Asset Pipeline
gem 'json'
gem 'sass'
gem 'coffee-script'
gem 'uglifier'
gem 'coffeebeans'

#gem "rails-backbone"

#template framework
#gem 'handlebars-rails'

#rails js
gem 'jquery-rails'
#gem "therubyrhino", :require => 'rhino'
#bundlegem "therubyracer", :require => 'v8'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'neo4j', :git => 'git://github.com/andreasronge/neo4j.git'

gem "gritter"

#rails authentication gems
#gem 'devise-neo4j',:git => 'git://github.com/joeleaver/devise-neo4j.git'
#gem 'devise', '1.2'
#gem 'devise-neo4j',:git => 'git://github.com/andreasronge/devise-neo4j'
#gem 'devise-neo4j', :git => 'git://github.com/joeleaver/devise-neo4j.git'
gem 'devise-neo4j', :git =>'git://github.com/benjackson/devise-neo4j.git'
#gem 'omniauth', :git =>  'git://github.com/intridea/omniauth.git'
gem "oa-oauth", :require => "omniauth/oauth", :git => 'git://github.com/intridea/omniauth.git'
gem 'jruby-openssl'
gem 'multi_xml'


gem 'will_paginate', :git => "git://github.com/akitaonrails/will_paginate.git", :branch => "rails3.1"

gem 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git"
gem 'nokogiri', "1.5.0.beta.4"#:git => 'git://github.com/tenderlove/nokogiri.git'#'nokogiri-1.5.0.beta.4'#, :require => "nokogiri"

gem 'statsample'

group :test, :development do
  gem 'rspec'#, "2.6.0.rc6"
  gem 'rspec-mocks'#, "2.6.0.rc6"

  gem 'rspec-rails', "2.6.1.beta1"
  #gem "rspec-rails-matchers"

  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'guard', "0.5.0" #, "0.4.2.1"#:git => "git://github.com/guard/guard.git"
  gem 'guard-rspec'


  gem 'rb-inotify'
  gem 'libnotify'#, :require => false #if RUBY_PLATFORM =~ /linux/i


  gem 'guard-livereload'
  gem 'guard-bundler'
  gem 'spork', "0.9.0.rc8"

  # Pretty printed test output
  gem 'turn', :require => false

#  gem 'fakefs'

end



group :cucumber do
    gem 'capybara'
    #gem 'database_cleaner'
    gem 'cucumber-rails'
    gem 'cucumber'
    #gem 'spork'
    gem 'launchy'
end




# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'neo4j', '1.0.0.beta.26'

#group :development do
#  gem 'rspec-rails'
#end


gem 'aws-s3', :require => 'aws/s3'
gem 'mechanize'
# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
gem "mocha", :group => :test

