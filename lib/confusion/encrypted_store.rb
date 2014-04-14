require 'json'
require 'rbnacl'
require 'time'

module Confusion
  # Key/value storage of encrypted data
  class EncryptedStore
    attr_reader :created

    def self.create(path, key)
      document  = JSON.generate('created' => Time.now.utc.to_s)
      secretbox = RbNaCl::RandomNonceBox.new RbNaCl::SecretBox.new(key)

      File.write path, secretbox.encrypt(document)
      new(path, key)
    end

    def initialize(path, key)
      @secretbox = RbNaCl::RandomNonceBox.new RbNaCl::SecretBox.new(key)

      ciphertext = File.read(path, encoding: 'BINARY')
      json = @secretbox.decrypt(ciphertext)
      document = JSON.parse(json, create_additions: false)

      @created = Time.parse(document['created'])
    end
  end
end
