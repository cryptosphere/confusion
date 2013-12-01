require 'rbnacl'

module Confusion
  class PublicKey
    def initialize(serialized_key)
      bytes = Confusion.base32_decode(serialized_key)
      @key  = RbNaCl::PublicKey.new(bytes)
    end

    def to_base32
      Confusion.base32_encode(@key.to_bytes)
    end
  end
end
