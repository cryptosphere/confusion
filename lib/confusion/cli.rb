require 'thor'
require 'confusion'
require 'logger'
require 'io/console'

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
    method_option :key,      type: 'string',  aliases: '-k'
    method_option :password, type: 'boolean', aliases: '-p'
    def encrypt(infile, outfile)
      key = extract_key(options)
      key.encrypt_file(infile, outfile)
      logger.info "Encrypted #{File.expand_path(infile)} into #{File.expand_path(outfile)}"
    end

    desc 'decrypt INFILE OUTFILE', 'Decrypt INFILE with a password or full strength key'
    method_option :key,      type: 'string',  aliases: '-k'
    method_option :password, type: 'boolean', aliases: '-p'
    def decrypt(infile, outfile)
      key = extract_key(options)
      key.decrypt_file(infile, outfile)
      logger.info "Decrypted #{File.expand_path(infile)} info #{File.expand_path(outfile)}"
    end

    no_commands do
      def extract_key(options)
        require 'confusion/keys/symmetric_key'

        if options[:key]
          if options[:password]
            logger.error "Can only specify one of --key or --password"
            exit 1
          end

          parse_key(options[:key])
        elsif options[:password]
          # A 32-byte salt, because why not?
          salt ||= RbNaCl::Random.random_bytes(32)
          password = prompt_for_password

          derive_key_from_password(password, salt)
        else
          logger.error "No --key or --password given"
          exit 1
        end
      end

      def parse_key(key_file)
        key_path = File.expand_path(key_file)
        key_uri  = File.read(key_path)

        Keys::SymmetricKey.parse(key_uri)
      rescue ParseError
        logger.error "Failed to parse #{Keys::SymmetricKey::URI_PREFIX} from #{key_path}"
        exit 1
      end

      # Our only password requirement
      MINIMUM_PASSWORD_LENGTH = 8

      def prompt_for_password
        # TODO: replace with ask("...", echo: false) if Thor fixes this upstream
        STDOUT.print "Enter password: "
        password = STDIN.noecho(&:gets).chomp
        STDOUT.puts

        unless password.bytesize >= MINIMUM_PASSWORD_LENGTH
          raise "Error: password too short (minimum #{MINIMUM_PASSWORD_LENGTH} bytes)"
        end

        password
      end

      # scrypt parameters for secure key derivation
      SCRYPT_N = 2**20 # CPU cost
      SCRYPT_r = 8     # memory cost
      SCRYPT_p = 1     # parallelism cost

      def derive_key_from_password(password, salt)
        digest = RbNaCl::PasswordHash.scrypt(password, salt, SCRYPT_N, SCRYPT_r, SCRYPT_p, RbNaCl::SecretBox.key_bytes)
        Keys::SymmetricKey.new(digest)
      end

      def logger
        Confusion.logger
      end
    end
  end
end
