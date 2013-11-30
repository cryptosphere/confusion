require "confusion/version"
require "confusion/encrypted_store"

module Confusion
  def self.logger
    Celluloid.logger
  end
end
