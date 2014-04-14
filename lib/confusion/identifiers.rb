# encoding: utf-8

module Confusion
  # Identifiers for keys used within Confusion
  module Identifiers
    SYMMETRIC_KEY  = 'crypt.key+xsalsa20poly1305+base32c'
    ASYMMETRIC_KEY = 'crypt.key+curve25519+base32c'
  end
end
