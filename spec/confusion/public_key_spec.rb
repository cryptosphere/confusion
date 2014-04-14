# encoding: utf-8

require 'spec_helper'

describe Confusion::PublicKey do
  let(:base32_key) { 'n7v4dnrstqid7n3kdraib7ebzinlawv42efvhlalnmihmqyrkrhq' }
  subject { described_class.new(base32_key) }

  it 'serializes to base32' do
    expect(subject.to_base32).to eq base32_key
  end
end
