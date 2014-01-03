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
          logger.error "No --key given"
          exit 1
        end

        key_path = File.expand_path(options[:key])
        key_uri  = File.read(key_path)

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
