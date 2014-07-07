# encoding: utf-8

require 'rbnacl/libsodium'

require 'confusion/version'

require 'confusion/exceptions'
require 'confusion/identifiers'
require 'confusion/keyset'
require 'confusion/encrypted_store'

require 'confusion/keys/private_key'
require 'confusion/keys/public_key'
require 'confusion/keys/symmetric_key'

# An experiment in unlinkable encrypted messaging
module Confusion
  class << self
    attr_accessor :logger, :store
  end

  WORDLIST = File.read(File.expand_path('../../wordlists/en.txt', __FILE__)).split("\n")
  WORDLIST.map(&:freeze)
  WORDLIST.freeze
end

# Initialize encrypted storage directory
Confusion.store = Confusion::EncryptedStore.new(File.join(Dir.home, '.confusion'))
