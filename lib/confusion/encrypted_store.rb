# encoding: utf-8

require 'json'
require 'rbnacl'
require 'openssl'
require 'time'
require 'fileutils'
require 'base64'

module Confusion
  # Key/value storage of encrypted data
  class EncryptedStore
    attr_reader :path

    # Number of bytes to use for PBKDF salt
    SALT_BYTES = 8

    # Number of iterations to use for PKBDF2
    PBKDF2_ITERATIONS = 100_000

    def initialize(path)
      @path = Pathname.new File.expand_path(path)
    end

    def created?
      File.directory? path
    end

    def create(password)
      fail 'already created' if created?
      salt        = RbNaCl::Random.random_bytes(SALT_BYTES)
      fingerprint = RbNaCl::Hash.sha256(pbkdf2(password, salt))
      config      = {
        kdf:         "ordo.pbkdf:///pbkdf2-sha512+base32c?c=#{PBKDF2_ITERATIONS}" \
                     "&salt=#{Encoding.encode(salt)}",
        fingerprint: "ni://sha256;#{Base64.urlsafe_encode64(fingerprint)}"
      }
      FileUtils.mkdir_p(path)
      File.write(config_path, JSON.pretty_generate(config))
      true
    end

    private

    def config_path
      @path.join('config.json')
    end

    def pbkdf2(password, salt, c = PBKDF2_ITERATIONS)
      OpenSSL::PKCS5.pbkdf2_hmac(password, salt, c, 512, OpenSSL::Digest::SHA512.new)
    end
  end
end
