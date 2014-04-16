# encoding: utf-8

require 'thor'
require 'confusion'
require 'logger'

# An experiment in unlinkable encrypted messaging
module Confusion
  self.logger = Logger.new(STDOUT)

  # Confusion's command line interface
  class CLI < Thor
    include Thor::Actions

    desc 'server', 'Run the Confusion server'
    method_option :host, default: '127.0.0.1', aliases: 'h'
    method_option :port, default: 1234
    def server
      require 'confusion/app'
      Confusion::App.run(options[:host], options[:port])
      sleep
    end

    desc 'keygen OUTFILE', 'Create a random symmetric key in OUTFILE'
    def keygen(outfile)
      require 'confusion/keys/symmetric_key'
      key = Keys::SymmetricKey.generate
      File.write(outfile, key.to_uri)
      logger.info "Wrote a random #{Identifiers::SYMMETRIC_KEY} to #{File.expand_path(outfile)}"
    end

    desc 'encrypt INFILE OUTFILE', 'Encrypt INFILE with a password or full strength key'
    method_option :key, type: 'string', aliases: '-k'
    def encrypt(infile, outfile)
      key = parse_key(options)
      key.encrypt_file(infile, outfile)
      logger.info "Encrypted #{File.expand_path(infile)} into #{File.expand_path(outfile)}"
    end

    desc 'decrypt INFILE OUTFILE', 'Decrypt INFILE with a password or full strength key'
    method_option :key, type: 'string', aliases: '-k'
    def decrypt(infile, outfile)
      key = parse_key(options)
      key.decrypt_file(infile, outfile)
      logger.info "Decrypted #{File.expand_path(infile)} info #{File.expand_path(outfile)}"
    end

    no_commands do
      def parse_key(options)
        require 'confusion/keys/symmetric_key'

        # Only support full-strength symmetric keys for now
        unless options[:key]
          logger.error 'No --key given'
          exit 1
        end

        key_uri  = File.read File.expand_path(options[:key])

        Keys::SymmetricKey.parse(key_uri)
      rescue ParseError
        logger.error "Failed to parse #{Keys::SymmetricKey::URI_PREFIX} from #{key_path}"
        exit 1
      end

      def logger
        Confusion.logger
      end
    end
  end
end
