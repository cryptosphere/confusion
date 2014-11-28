extern crate nickel;
extern crate http;

use std::io::net::ip::Ipv4Addr;
use nickel::{
  Nickel,
  Request,
  Response,
  HttpRouter,
  StaticFilesHandler
};

mod encrypted_store;

fn main() {
  let addr = Ipv4Addr(127, 0, 0, 1);
  let port = 3000;

  let mut server = Nickel::new();
  let mut router = Nickel::router();

  router.get("/", root_handler);

  server.utilize(router);
  server.utilize(StaticFilesHandler::new("frontend/"));

  println!("Listening on http://{}:{}", addr, port);
  server.listen(addr, port);
}

fn root_handler(_request: &Request, response: &mut Response) {
  response.send_file(&Path::new("frontend/setup.html")).ok();
}
