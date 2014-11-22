extern crate nickel;
extern crate http;

use std::io::net::ip::Ipv4Addr;
use nickel::{
  Nickel,
  StaticFilesHandler
};

fn main() {
  let mut server = Nickel::new();
  let port = 3000;

  server.utilize(StaticFilesHandler::new("frontend/"));

  println!("Listening on http://localhost:{}", port);
  server.listen(Ipv4Addr(127, 0, 0, 1), port);
}
