require 'base32'

module Confusion
  # Encode and parse strings in "base32c" format (i.e. base32, but lower case)
  module Encoding
    module_function

    # Encode a string in Cryptosphere-style Base32
    #
    # @param string [String] arbitrary string to be encoded
    # @return [String] lovely, elegant Cryptosphere-style Base32
    def encode(string)
      Base32.encode(string).downcase.sub(/=+$/, '')
    end

    # Decode a Base32 string
    #
    # @param string [String] Base32 string to be decoded
    # @return [String] decoded string
    def decode(string)
      Base32.decode(string.upcase)
    end
  end
end
