require 'rbnacl'

module Confusion
  class PrivateKey
    def self.generate
      key = RbNaCl::PrivateKey.generate.to_bytes
      new Confusion.base32_encode(key)
    end

    def initialize(serialized_key)
      bytes = Confusion.base32_decode(serialized_key)
      @key  = RbNaCl::PrivateKey.new(bytes)
    end

    def to_base32
      Confusion.base32_encode @key.to_bytes
    end

    def public_key
      key = @key.public_key.to_bytes
      PublicKey.new Confusion.base32_encode(key)
    end
  end
end
