# encoding: utf-8

require 'confusion/version'

require 'confusion/exceptions'
require 'confusion/identifiers'
require 'confusion/keyset'
require 'confusion/encrypted_store'
require 'confusion/private_key'
require 'confusion/public_key'

# An experiment in unlinkable encrypted messaging
module Confusion
  class << self
    attr_accessor :logger
  end
end
