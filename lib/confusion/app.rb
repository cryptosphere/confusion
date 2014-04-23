# encoding: utf-8

require 'confusion'
require 'reel/rack'
require 'sinatra'
require 'secure_headers'

::SecureHeaders::Configuration.configure do |config|
  config.hsts                   = { max_age: 315_360_000, include_subdomains: true }
  config.x_frame_options        = 'DENY'
  config.x_content_type_options = 'nosniff'
  config.x_xss_protection       = { value: 1, mode: 'block' }
  config.csp                    = { default_src: 'self', enforce: true }
end

# An experiment in unlinkable encrypted messaging
module Confusion
  # Sinatra application behind the web API
  class App < Sinatra::Base
    include SecureHeaders

    configure :production, :development do
      enable :logging
    end

    ASSET_ROOT = Pathname.new(File.expand_path('../../../webui', __FILE__))

    def self.rack_app
      app = new
      Rack::Builder.new do
        use Rack::CommonLogger, STDOUT
        use Rack::ShowExceptions
        use Rack::Static, urls: %w(/css /img /js), root: ASSET_ROOT
        run app
      end
    end

    def self.run(host, port)
      Reel::Rack::Server.new(rack_app, Host: host, Port: port)
    end

    get '/' do
      set_csp_header
      if Confusion.store.created?
        ASSET_ROOT.join('index.html').read
      else
        ASSET_ROOT.join('setup.html').read
      end
    end
  end
end
