require 'confusion/resource'

module Confusion
  module Resources
    class Asset < Confusion::Resource
      FILE_LIST  = Dir[File.join(APP_ROOT, "**", "*")].map { |f| f.sub(/^#{APP_ROOT}\//, '') }

      def resource_exists?
        FILE_LIST.include? asset_path
      end

      def content_types_provided
        return [["text/html", nil]] if request.path_tokens.empty?
        extension = request.path_tokens.last[/\.([a-z0-9]+)$/, 1]

        case extension
        when 'htm', 'html'
          [["text/html", :produce_file]]
        when 'css'
          [["text/css", :produce_file]]
        when 'js'
          [["text/javascript", :produce_file]]
        when 'png'
          [["image/png", :produce_file]]
        else
          [["text/html", nil]]
        end
      end

      def produce_file
        Pathname.new(APP_ROOT).join(asset_path).read
      end

      def asset_path
        request.path_tokens.join("/")
      end
    end
  end
end
