require 'thor'
require 'confusion'

module Confusion
  class CLI < Thor

    desc 'server', 'Run the Confusion server'
    def server
      require 'confusion/app'

      Confusion.logger.info "Starting web UI on http://#{Confusion::APP_ADDR}:#{Confusion::APP_PORT}"
      Confusion::App.run
    end
  end
end