require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  ENV["RAILS_ENV"] = 'test'
require File.expand_path("../../config/environment", __FILE__)
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}



  #require "bundler/setup"
  require 'rspec'
  require 'rspec/core'
  require 'rspec/rails'
  require 'rspec/mocks'
  require 'fileutils'
  require 'tmpdir'
  #require 'rspec-rails-matchers'
  require 'benchmark'

  #require 'fakefs/spec_helpers'

  $LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "app")

  require 'neo4j'

  require 'logger'
  Neo4j::Config[:logger_level] = Logger::ERROR
  Neo4j::Config[:storage_path] = File.join(Dir.tmpdir, "neo4j-rspec-db")


  def rm_db_storage
    FileUtils.rm_rf Neo4j::Config[:storage_path]
    raise "Can't delete db" if File.exist?(Neo4j::Config[:storage_path])
  end

  def finish_tx
    return unless @tx
    @tx.success
    @tx.finish
    @tx = nil
  end

  def new_tx
    finish_tx if @tx
    @tx = Neo4j::Transaction.new
  end

  # ensure the translations get picked up for tests
  I18n.load_path += Dir[File.join(File.dirname(__FILE__), '..', 'config', 'locales', '*.{rb,yml}')]

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

  # load all fixture classes
  Dir["#{File.dirname(__FILE__)}/fixture/**/*.rb"].each {|f| require f}

  # set database storage location
  Neo4j::Config[:storage_path] = File.join(Dir.tmpdir, 'neo4j-rspec-tests')

  RSpec.configure do |c|
    #c.include FakeFS::SpecHelpers
    c.include Devise::TestHelpers, :type => :controller
  #c.filter = { :type => :problem}
    c.before(:each, :type => :transactional) do
      new_tx
    end

    c.after(:each, :type => :transactional) do
      finish_tx
      Neo4j::Transaction.run do
        Neo4j._all_nodes.each { |n| n.del unless n.neo_id == 0 }
      end
    end

    c.after(:each) do
      finish_tx
      Neo4j::Transaction.run do
        Neo4j._all_nodes.each { |n| n.del unless n.neo_id == 0 }
      end
    end

    c.before(:all) do
      Neo4j.start
    end

    c.after(:all) do
      finish_tx
      Neo4j.shutdown
      rm_db_storage
    end

  end


  module TempModel
    @@_counter = 1

    def self.set(klass, name=nil)
      name ||= "Model_#{@@_counter}"
      @@_counter += 1
      klass.class_eval <<-RUBY
	def self.to_s
	  "#{name}"
	end
      RUBY
      Kernel.const_set(name, klass)
      klass
    end
  end

  def create_model(base_class = Neo4j::Model, &block)
    klass = Class.new(base_class)
    TempModel.set(klass)
    klass.class_eval &block if block
    klass
  end

  def create_node_mixin_subclass(parent_clazz = Object, &block)
    klass = Class.new(parent_clazz)
    TempModel.set(klass)
    klass.send(:include, Neo4j::NodeMixin)
    klass.class_eval &block if block
    klass
  end

  def create_node_mixin(name=nil, &block)
    klass = Class.new
    TempModel.set(klass, name)
    klass.send(:include, Neo4j::NodeMixin)
    klass.class_eval &block if block
    klass
  end

  def create_rel_mixin(name=nil, &block)
    klass = Class.new
    TempModel.set(klass, name)
    klass.send(:include, Neo4j::RelationshipMixin)
    klass.class_eval &block if block
    klass
  end


end

Spork.each_run do
  # This code will be run each time you run your specs.

end

# --- Instructions ---
# Sort the contents of this file into a Spork.prefork and a Spork.each_run
# block.
#
# The Spork.prefork block is run only once when the spork server is started.
# You typically want to place most of your (slow) initializer code in here, in
# particular, require'ing any 3rd-party gems that you don't normally modify
# during development.
#
# The Spork.each_run block is run each time you run your specs.  In case you
# need to load files that tend to change during development, require them here.
# With Rails, your application modules are loaded automatically, so sometimes
# this block can remain empty.
#
# Note: You can modify files loaded *from* the Spork.each_run block without
# restarting the spork server.  However, this file itself will not be reloaded,
# so if you change any of the code inside the each_run block, you still need to
# restart the server.  In general, if you have non-trivial code in this file,
# it's advisable to move it into a separate file so you can easily edit it
# without restarting spork.  (For example, with RSpec, you could move
# non-trivial code into a file spec/support/my_helper.rb, making sure that the
# spec/support/* files are require'd from inside the each_run block.)
#
# Any code that is left outside the two blocks will be run during preforking
# *and* during each_run -- that's probably not what you want.
#
# These instructions should self-destruct in 10 seconds.  If they don't, feel
# free to delete them.

