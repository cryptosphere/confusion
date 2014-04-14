# encoding: utf-8

require 'confusion'
require 'lattice'

I18n.enforce_available_locales = false

# An experiment in unlinkable encrypted messaging
module Confusion
  # Default address of the webapp
  APP_ADDR = '127.0.0.1'

  # Default port of the webapp
  APP_PORT = 1234

  # Root directory for static assets
  APP_ROOT = File.expand_path('../../../webui', __FILE__)

  require 'confusion/resources/asset'
  require 'confusion/resources/home'
  require 'confusion/resources/setup'

  # The Confusion webapp
  App = Webmachine::Application.new do |app|
    app.routes do
      # Base web application routes
      add ['assets', '*'], Resources::Asset
      add ['setup'],       Resources::Setup
      add ['*'], Resources::Home
    end

    app.configure do |config|
      config.ip      = APP_ADDR
      config.port    = APP_PORT
      config.adapter = :Reel
    end
  end

  # Log requests to Confusion
  class RequestLogger
    def call(*args)
      handle_event(Webmachine::Events::InstrumentedEvent.new(*args))
    end

    def handle_event(event)
      request  = event.payload[:request]

      Confusion.logger.info format(
        "\"%s %s\" %d %.1fms (%s)",
        effective_method(request),
        URI(request.uri).path,
        event.payload[:code],
        event.duration,
        event.payload[:resource])
    end

    # Translate extended HTTP verbs via the magical query parameter
    def effective_method(request)
      if request.method == 'POST' && request.query['_method']
        request.query['_method']
      else
        request.method
      end
    end
  end

  Webmachine::Events.subscribe('wm.dispatch', RequestLogger.new)
end
