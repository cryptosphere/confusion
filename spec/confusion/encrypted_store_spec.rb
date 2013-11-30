require 'spec_helper'
require 'tmpdir'

describe Confusion::EncryptedStore do
  let(:encrypted_store_path) { File.join(Dir.tmpdir, "example_encrypted_store") }

  # http://uncyclopedia.wikia.com/wiki/AAAAAAAAA!
  let(:encrypted_store_key)  { "A" * 32 }

  before do
    FileUtils.rm_rf(encrypted_store_path)
  end

  it "creates new stores" do
    store = described_class.create(encrypted_store_path, encrypted_store_key)
    store.created.should be_a Time
  end
end
