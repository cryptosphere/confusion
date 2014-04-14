# encoding: utf-8

require 'json'
require 'rbnacl'
require 'time'

module Confusion
  # Key/value storage of encrypted data
  class EncryptedStore
    attr_reader :path

    def initialize(path)
      @path = File.expand_path(path)
    end

    def created?
      File.directory? path
    end
  end
end
