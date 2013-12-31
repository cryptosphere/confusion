require 'thor'
require 'confusion'
require 'logger'

module Confusion
  self.logger = Logger.new(STDOUT)

  class CLI < Thor
    include Thor::Actions


    desc 'server', 'Run the Confusion server'
    def server
      require 'confusion/app'

      Confusion.logger.info "Starting web UI on http://#{Confusion::APP_ADDR}:#{Confusion::APP_PORT}"
      Confusion::App.run
    end

    desc 'keygen OUTFILE', 'Create a random symmetric key in OUTFILE'
    def keygen(outfile)
      require 'confusion'
      key_bytes = RbNaCl::Random.random_bytes(RbNaCl::SecretBox.key_bytes)
      key = "#{Identifiers::SYMMETRIC_KEY}:#{Encoding.encode(key_bytes)}"
      File.write(outfile, key)
      logger.info "Wrote a random #{Identifiers::SYMMETRIC_KEY} to #{File.expand_path(outfile)}"
    end

    desc 'encrypt INFILE OUTFILE', 'Encrypt INFILE with a password or full strength key'
    method_option :key, type: 'string', aliases: '-k'
    def encrypt(infile, outfile)
      require 'confusion'

      # Only support full-strength symmetric keys for now
      unless options[:key]
        logger.error "No --key given"
        exit 1
      end

      key_path   = File.expand_path(options[:key])
      key_text   = File.read(key_path).force_encoding('BINARY')
      key_base32 = key_text[/\A#{Regexp.escape(Identifiers::SYMMETRIC_KEY)}:([a-z0-9]{52})\z/, 1]

      unless key_base32
        logger.error "Failed to parse #{Identifiers::SYMMETRIC_KEY} from #{key_path}"
        exit 1
      end

      key_bytes  = Encoding.decode(key_base32)
      secret_box = RbNaCl::RandomNonceBox.from_secret_key(key_bytes)

      plaintext  = File.read(infile).force_encoding('BINARY')
      ciphertext = secret_box.encrypt(plaintext)
      File.write(outfile, ciphertext)
      logger.info "Encrypted #{File.expand_path(infile)} into #{File.expand_path(outfile)}"
    end

    desc 'decrypt INFILE OUTFILE', 'Decrypt INFILE with a password or full strength key'
    method_option :key, type: 'string', aliases: '-k'
    def decrypt(infile, outfile)
      require 'confusion'

      # Only support full-strength symmetric keys for now
      unless options[:key]
        logger.error "No --key given"
        exit 1
      end

      key_path   = File.expand_path(options[:key])
      key_text   = File.read(key_path).force_encoding('BINARY')
      key_base32 = key_text[/\A#{Regexp.escape(Identifiers::SYMMETRIC_KEY)}:([a-z0-9]{52})\z/, 1]

      unless key_base32
        logger.error "Failed to parse #{Identifiers::SYMMETRIC_KEY} from #{key_path}"
        exit 1
      end

      key_bytes  = Encoding.decode(key_base32)
      secret_box = RbNaCl::RandomNonceBox.from_secret_key(key_bytes)

      ciphertext = File.read(infile).force_encoding('BINARY')
      plaintext  = secret_box.decrypt(ciphertext)
      File.write(outfile, plaintext)
      logger.info "Decrypted #{File.expand_path(infile)} info #{File.expand_path(outfile)}"
    end

    no_commands do
      def logger
        Confusion.logger
      end
    end
  end
end
