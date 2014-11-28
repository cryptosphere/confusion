use std::io;
use std::io::fs;
use std::io::fs::PathExtensions;

pub struct EncryptedStore {
  path: Path
}

impl EncryptedStore {
  pub fn new(path: Path) -> EncryptedStore {
    EncryptedStore { path: path }
  }

  pub fn created(&self) -> bool {
    self.path.exists()
  }

  pub fn create(&self, key: &[u8]) {
    fs::mkdir(&self.path, io::USER_RWX);
  }
}

#[test]
fn test_new() {
  let store = EncryptedStore::new(Path::new("/tmp/foobar"));
  let key   = "foobar";

  assert!(store.created() == false);
  store.create(key.as_bytes());
}
