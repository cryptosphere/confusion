# encoding: utf-8

require 'coveralls'
Coveralls.wear!

require 'rubygems'
require 'bundler/setup'
require 'confusion'

RSpec.configure { |c| c.disable_monkey_patching! }
