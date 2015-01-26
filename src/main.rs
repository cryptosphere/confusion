extern crate nickel;

use nickel::{Nickel, Request, Response, HttpRouter, StaticFilesHandler};
use std::io::net::ip::Ipv4Addr;

fn main() {
  let addr = Ipv4Addr(127, 0, 0, 1);
  let port = 3000;

  let mut server = Nickel::new();

  fn root_handler(_request: &Request, response: &mut Response) {
    response.send_file(&Path::new("frontend/setup.html")).ok();
  }

  let root: fn(&Request, &mut Response) = root_handler;

  server.get("/", root);
  server.utilize(StaticFilesHandler::new("frontend/"));
  server.listen(addr, port);
}
