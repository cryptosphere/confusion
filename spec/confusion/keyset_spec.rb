# encoding: utf-8

require 'spec_helper'

describe Confusion::Keyset do
  it 'generates new keysets' do
    expect(described_class.generate).to be_a described_class
  end
end
