# encoding: utf-8

require 'json'
require 'rbnacl'
require 'time'
require 'fileutils'
require 'base64'

module Confusion
  # Key/value storage of encrypted data
  class EncryptedStore
    attr_reader :path

    # Number of bytes to use for scrypt salt
    SALT_BYTES = 32

    # scrypt work factor and memory factor (libsodium style)
    SCRYPT_OPSLIMIT = 758_010
    SCRYPT_MEMLIMIT = 5_432_947

    def initialize(path)
      @path = Pathname.new File.expand_path(path)
    end

    def created?
      File.directory? path
    end

    def create(password)
      fail 'already created' if created?
      salt        = RbNaCl::Random.random_bytes(SALT_BYTES)
      fingerprint = RbNaCl::Hash.sha256(scrypt(password, salt))
      config      = {
        kdf:         scrypt_uri(salt),
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

    def scrypt(password, salt)
      RbNaCl::PasswordHash.scrypt(
        password,
        salt,
        SCRYPT_OPSLIMIT,
        SCRYPT_MEMLIMIT
      )
    end

    def scrypt_uri(salt)
      'ordo.pbkdf:///scrypt?' \
      "opslimit=#{SCRYPT_OPSLIMIT}" \
      "&memlimit=#{SCRYPT_MEMLIMIT}" \
      "&salt=#{Encoding.encode(salt)}"
    end
  end
end
