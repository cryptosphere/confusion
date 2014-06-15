# encoding: utf-8

require 'spec_helper'

RSpec.describe Confusion::Keys::PrivateKey do
  subject { described_class.generate }

  it 'calculates a public key' do
    expect(subject.public_key).to be_a Confusion::Keys::PublicKey
  end

  it 'serializes to Base32' do
    base32 = 'nppr22q2l6d5cj567evq7zi52avnbu4z7dmrmp2hjqer6okkz5wa'
    key = described_class.new(base32)
    expect(key.to_base32).to eq base32
  end
end
