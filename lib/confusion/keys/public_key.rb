# encoding: utf-8

require 'rbnacl'
require 'confusion/encoding'

module Confusion
  module Keys
    # Curve25519 Diffie-Hellman public key
    class PublicKey
      def initialize(serialized_key)
        bytes = Encoding.decode(serialized_key)
        @key  = RbNaCl::PublicKey.new(bytes)
      end

      def to_base32
        Encoding.encode(@key.to_bytes)
      end
    end
  end
end
