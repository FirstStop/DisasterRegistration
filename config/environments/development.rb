require 'socket'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  #used for qr code generation
  routes.default_url_options[:host]=Socket.gethostname
  routes.default_url_options[:port]="3000"
  
  # Configure mongo_mapper gem
  config.gem "mongo_mapper"
  config.gem "exodus"
 
 Exodus.configure do |config|
     config.db = MongoMapper.database
     config.connection = MongoMapper.connection
     config.config_file = File.dirname(__FILE__) + '/../mongo.yml'
     config.migrations_directory = File.dirname(__FILE__) + '/../../db/mongo_migrate'
 end
end

