require 'rbnacl'
require 'confusion'

module Confusion
  module Keys
    # Symmetric key support which can obtain a box-like class
    #
    # These are only directly used for full-strength symmetric key and password
    # based cryptography, i.e. any Confusion functions utilizing public keys
    # do not use this functionality, as they use hybrid encryption schemes
    # which are fully integrated inside of NaCl/libsodium.
    class SymmetricKey
      # URI prefix which identifies the only symmetric keys we support
      # i.e. crypt.key+xsalsa20poly1305+base32
      URI_PREFIX = Identifiers::SYMMETRIC_KEY

      attr_reader :bytes

      KEY_PATTERN = /\A#{Regexp.escape(URI_PREFIX)}:([a-z0-9]{52})\z/

      # Generate a new symmetric key using libsodium's built-in random number
      # generator (which uses /dev/random on *IX or CryptGenRandom on Windows)
      #
      # @return [Confusion::Keys::SymmetricKey] random symmetric key
      def self.generate
        key_bytes = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
        new(key_bytes)
      end

      # Parse a symmetric key URI. These URIs look like the following:
      #
      #     crypt.key+xsalsa20poly1305+base32c:xxxxxxxx.....
      #
      # @param key_uri [String] URI representing a key to decode
      # @return [Confusion::Keys::SymmetricKey] symmetric key object
      def self.parse(key_uri)
        parsed_key = key_uri.force_encoding('BINARY')[KEY_PATTERN, 1]
        fail ParseError, "couldn't parse symmetric key" unless parsed_key

        new(Encoding.decode(parsed_key))
      end

      # Create a symmetric key from the given byte array
      #
      # @param key_bytes [String] byte array representing a symmetric key
      # @return [Confusion::Keys::SymmetricKey] symmetric key objecf
      def initialize(key_bytes)
        @bytes = RbNaCl::Util.check_string(
          key_bytes.force_encoding('BINARY'),
          RbNaCl::SecretBox.key_bytes,
          'Secret key'
        )
      end

      # Encrypt a file using this SymmetricKey
      #
      # @param infile  [String] path to input plaintext
      # @param outfile [String] path to output ciphertext
      def encrypt_file(infile, outfile)
        plaintext  = File.read(infile).force_encoding('BINARY')
        ciphertext = box.encrypt(plaintext)
        File.write(outfile, ciphertext)
        true
      end

      # Decrypt a file using this SymmetricKey
      #
      # @param infile  [String] path to input ciphertext
      # @param outfile [String] path to output ciphertext
      def decrypt_file(infile, outfile)
        ciphertext = File.read(infile).force_encoding('BINARY')
        plaintext  = box.decrypt(ciphertext)
        File.write(outfile, plaintext)
        true
      end

      # Return this key as a serialized URI
      #
      # @return [String] key encoded as a URI
      def to_uri
        "#{URI_PREFIX}:#{Encoding.encode(bytes)}"
      end

      private

      # Create a RbNaCl box-alike object for symmetric encryption from this key
      #
      # @return [RbNaCl::RandomNonceBox] a RandomNonceBox object using this key
      def box
        RbNaCl::RandomNonceBox.from_secret_key(@bytes)
      end
    end
  end
end
