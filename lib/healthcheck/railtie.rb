require 'rails'

module Healthcheck
  class Railtie < ::Rails::Railtie
    if config.force_ssl
      config.app_middleware.insert_before ActionDispatch::SSL, Healthcheck::Middleware
    else
      config.app_middleware.use Healthcheck::Middleware
    end
  end
end
