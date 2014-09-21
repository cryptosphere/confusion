extern crate iron;
extern crate static_file;
extern crate mount;

use std::io::net::ip::Ipv4Addr;
use iron::{Iron, Request, Response, IronResult};
use iron::status;
use static_file::Static;
use mount::Mount;

fn login(_req: &mut Request) -> IronResult<Response> {
    Ok(Response::with(status::Ok, "Seems good bro"))
}

fn main() {
    let mut mount = Mount::new();

    mount.mount("/login", login);
    mount.mount("/", Static::new(Path::new("webui/")));

    Iron::new(mount).listen(Ipv4Addr(127, 0, 0, 1), 3000);
    println!("Listening on http://localhost:3000");
}
