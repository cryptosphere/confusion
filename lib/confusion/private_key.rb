require 'rbnacl'
require 'confusion/encoding'

module Confusion
  class PrivateKey
    def self.generate
      key = RbNaCl::PrivateKey.generate.to_bytes
      new Encoding.encode(key)
    end

    def initialize(serialized_key)
      bytes = Encoding.decode(serialized_key)
      @key  = RbNaCl::PrivateKey.new(bytes)
    end

    def to_base32
      Encoding.encode @key.to_bytes
    end

    def public_key
      key = @key.public_key.to_bytes
      PublicKey.new Encoding.encode(key)
    end
  end
end
