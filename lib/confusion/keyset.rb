module Confusion
  class Keyset
    DEFAULT_SIZE = 256

    def self.generate(size = DEFAULT_SIZE)
      keys = size.times.map { PrivateKey.generate.to_base32 }
      new keys
    end

    def initialize(serialized_keys)
      @keys = serialized_keys.map { |key| PrivateKey.new(key) }
    end
  end
end
