require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Infractores
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'America/Argentina/Buenos_Aires'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es
    config.middleware.insert_after ActionDispatch::Static, Rack::LiveReload if Rails.env.development?

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end

# in config/application.rb, before the application loads
class ActiveRecordOverrideRailtie < Rails::Railtie
  initializer "active_record.initialize_database.override" do |app|

    ActiveSupport.on_load(:active_record) do
      if url = ENV['DATABASE_URL']
        ActiveRecord::Base.connection_pool.disconnect!
        parsed_url = URI.parse(url)
        config =  {
          adapter:             'postgis',
          host:                parsed_url.host,
          encoding:            'unicode',
          database:            parsed_url.path.split("/")[-1],
          port:                parsed_url.port,
          username:            parsed_url.user,
          password:            parsed_url.password
        }
        establish_connection(config)
      end
    end
  end
end
