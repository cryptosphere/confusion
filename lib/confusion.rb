require "confusion/version"
require "confusion/keyset"
require "confusion/encrypted_store"
require "confusion/private_key"
require "confusion/public_key"

module Confusion
  def self.logger
    Celluloid.logger
  end

  def self.base32_encode(string)
    Base32.encode(string).downcase.gsub(/=+$/, '')
  end

  def self.base32_decode(string)
    Base32.decode(string.upcase)
  end
end
