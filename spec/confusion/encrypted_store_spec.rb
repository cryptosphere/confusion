# encoding: utf-8

require 'spec_helper'
require 'tmpdir'

describe Confusion::EncryptedStore do
  let(:encrypted_store_path) { File.join(Dir.tmpdir, 'example_encrypted_store') }

  # http://uncyclopedia.wikia.com/wiki/AAAAAAAAA!
  let(:encrypted_store_key)  { 'A' * 32 }

  # Petname for our conversation partner
  let(:partner_petname) { 'Bob' }

  before do
    FileUtils.rm_rf(encrypted_store_path)
  end

  subject { described_class.create(encrypted_store_path, encrypted_store_key) }

  it 'knows its creation time' do
    subject.created.should be_a Time
    subject.created.to_f.should be_within(1).of Time.now.to_f
  end
end
