extern crate iron;
extern crate static_file;
extern crate mount;

use std::io::net::ip::Ipv4Addr;
use iron::{Iron, Request, Response, IronResult};
use iron::status;
use static_file::Static;
use mount::Mount;

fn root(_req: &mut Request) -> IronResult<Response> {
  match Response::from_file(&Path::new("webui/index.html")) {
    Ok(response) => { Ok(response) },
    Err(_err)    => { Ok(Response::status(status::NotFound)) }
  }
}

fn login(_req: &mut Request) -> IronResult<Response> {
  Ok(Response::with(status::Ok, "Seems good bro"))
}

fn main() {
  let mut mount = Mount::new();

  mount.mount("/", root);
  mount.mount("/login", login);

  mount.mount("/css",   Static::new(Path::new("webui/css")));
  mount.mount("/img",   Static::new(Path::new("webui/img")));
  mount.mount("/js",    Static::new(Path::new("webui/js")));
  mount.mount("/fonts", Static::new(Path::new("webui/fonts")));

  Iron::new(mount).listen(Ipv4Addr(127, 0, 0, 1), 3000);
  println!("Listening on http://localhost:3000");
}
