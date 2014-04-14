# encoding: utf-8

require 'lattice'

module Confusion
  # Base class of all Confusion::App resources
  class Resource < Lattice::Resource
    def finish_request
      response.headers['Content-Security-Policy'] = "default-src 'self'"
      response.headers['X-Content-Type-Options']  = 'nosniff'
      response.headers['X-Frame-Options']         = 'DENY'
    end
  end
end
