# encoding: utf-8

require 'confusion/resource'

module Confusion
  module Resources
    # Handles '/' for the Confusion web UI
    class Home < Confusion::Resource
      def to_html
        if Confusion.store.created?
          File.read File.join(APP_ROOT, 'index.html')
        else
          File.read File.join(APP_ROOT, 'setup.html')
        end
      end
    end
  end
end
