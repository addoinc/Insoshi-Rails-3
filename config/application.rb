require File.expand_path('../boot', __FILE__)

require 'rails/all'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module InsoshiOriginal
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/app/sweeters)
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]
    config.filter_parameters += [:password, :password_confirmation]
    config.generators do |g|
      g.test_framework :rspec
    end
 end
end

=begin
module InsoshiOriginal
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # See Rails::Configuration for more options.
  
    # Skip frameworks you're not going to use (only works if using vendor/rails).
    # To use Rails without a database, you must remove the Active Record framework
    # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  
    # Only load the plugins named here, in the order given. By default, all plugins 
    # in vendor/plugins are loaded in alphabetical order.
    # :all can be used as a placeholder for all plugins not explicitly named
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
  
    # Add additional load paths for your own custom dirs
    config.load_paths += %W( #{RAILS_ROOT}/app/sweepers )
  
  
    # Force all environments to use the same logger level
    # (by default production uses :info, the others :debug)
    # config.log_level = :debug
  
    # Your secret key for verifying cookie session data integrity.
    # If you change this key, all old sessions will become invalid!
    # Make sure the secret is at least 30 characters and all random, 
    # no regular words or you'll be exposed to dictionary attacks.
    secret_file = File.join(RAILS_ROOT, "secret")
    if File.exist?(secret_file)
      secret = File.read(secret_file)
    else
      secret = ActiveSupport::SecureRandom.hex(64)
      File.open(secret_file, 'w') { |f| f.write(secret) }
    end
    config.action_controller.session = {
      :session_key => '_instant_social_session',
      :secret      => secret
    }
  
    # Use the database for sessions instead of the cookie-based default,
    # which shouldn't be used to store highly confidential information
    # (create the session table with 'rake db:sessions:create')
    # config.action_controller.session_store = :active_record_store
  
    # Use SQL instead of Active Record's schema dumper when creating the test database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql
  
    # Activate observers that should always be running
    # config.active_record.observers = :cacher, :garbage_collector
  
    # Make Active Record use UTC-base instead of local time
    # config.active_record.default_timezone = :utc
    
    # Custom gem requirements
    # config.gem 'mislav-will_paginate', :version => '~> 2.3.2',
    #                                    :lib => 'will_paginate',
    #                                    :source => 'http://gems.github.com'
    config.gem 'chronic'
    config.gem 'BlueCloth', :lib => 'bluecloth'
    # config.gem 'rack-openid', :version => '>= 1.0.1'
  end
end
=end
