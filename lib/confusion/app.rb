require 'confusion'
require 'lattice'

module Confusion
  # Default address of the webapp
  APP_ADDR = "127.0.0.1"

  # Default port of the webapp
  APP_PORT = 1234

  # Root directory for static assets
  APP_ROOT = File.expand_path("../../../webui", __FILE__)

  require 'confusion/resources/asset'
  require 'confusion/resources/home'

  # The Confusion webapp
  App = Webmachine::Application.new do |app|
    app.routes do
      # Base web application routes
      add ['assets', '*'], Resources::Asset
      add ['*'], Resources::Home
    end

    app.configure do |config|
      config.ip      = APP_ADDR
      config.port    = APP_PORT
      config.adapter = :Reel
    end
  end

  class RequestLogger
    def call(*args)
      handle_event(Webmachine::Events::InstrumentedEvent.new(*args))
    end

    def handle_event(event)
      request  = event.payload[:request]
      resource = event.payload[:resource]
      code     = event.payload[:code]
      uri      = URI(request.uri)

      # Translate extended HTTP verbs via the magical query parameter
      if request.method == "POST" && request.query['_method']
        method = request.query['_method']
      else
        method = request.method
      end

      Confusion.logger.info "\"%s %s\" %d %.1fms (%s)" % [
        method, uri.path, code, event.duration, resource
      ]
    end
  end

  Webmachine::Events.subscribe('wm.dispatch', RequestLogger.new)
end
