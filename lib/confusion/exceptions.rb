module Confusion
  # Couldn't understand a given text string which was supposed to represent
  # something meaningful (i.e. a key or a ciphertext)
  ParseError = Class.new(StandardError)

  # A length wasn't the one we were expecting
  LengthError = Class.new(StandardError)
end
