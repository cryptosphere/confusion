# An experiment in unlinkable encrypted messaging
module Confusion
  # Couldn't understand a given text string which was supposed to represent
  # something meaningful (i.e. a key or a ciphertext)
  ParseError = Class.new(StandardError)
end
