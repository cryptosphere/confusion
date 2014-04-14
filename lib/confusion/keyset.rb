# encoding: utf-8

module Confusion
  # Stores sets of Curve25519 Diffie-Hellman keys
  class Keyset
    DEFAULT_SIZE = 256

    def self.generate(size = DEFAULT_SIZE)
      keys = size.times.map { Keys::PrivateKey.generate.to_base32 }
      new keys
    end

    def initialize(serialized_keys)
      @keys = serialized_keys.map { |key| Keys::PrivateKey.new(key) }
    end
  end
end
