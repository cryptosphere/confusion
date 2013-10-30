require 'confusion/resource'

module Confusion
  module Resources
    class Home < Confusion::Resource
      def to_html
        # Hax serve a static file!
        File.read File.join(APP_ROOT, "index.html")
      end
    end
  end
end
