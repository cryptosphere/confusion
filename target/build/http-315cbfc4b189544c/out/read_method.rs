// This automatically generated file is included in request.rs.
pub mod dummy {
use std::io::{Stream, IoResult};
use method::Method;
use method::Method::{Connect, Delete, Get, Head, Options, Patch, Post, Put, Trace, ExtensionMethod};
use server::request::MAX_METHOD_LEN;
use rfc2616::{SP, is_token_item};
use buffer::BufferedStream;

#[inline]
pub fn read_method<S: Stream>(stream: &mut BufferedStream<S>) -> IoResult<Method> {
    let (s, next_byte) = match stream.read_byte() {
        Ok(b'C') => match stream.read_byte() {
            Ok(b'O') => match stream.read_byte() {
                Ok(b'N') => match stream.read_byte() {
                    Ok(b'N') => match stream.read_byte() {
                        Ok(b'E') => match stream.read_byte() {
                            Ok(b'C') => match stream.read_byte() {
                                Ok(b'T') => match stream.read_byte() {
                                    Ok(b' ') => return Ok(Connect),
                                    Ok(b) if is_token_item(b) => ("CONNECT", b),
                                    Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                                    Err(err) => return Err(err),
                                },
                                Ok(b' ') => return Ok(ExtensionMethod(String::from_str("CONNEC"))),
                                Ok(b) if is_token_item(b) => ("CONNEC", b),
                                Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                                Err(err) => return Err(err),
                            },
                            Ok(b' ') => return Ok(ExtensionMethod(String::from_str("CONNE"))),
                            Ok(b) if is_token_item(b) => ("CONNE", b),
                            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                            Err(err) => return Err(err),
                        },
                        Ok(b' ') => return Ok(ExtensionMethod(String::from_str("CONN"))),
                        Ok(b) if is_token_item(b) => ("CONN", b),
                        Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                        Err(err) => return Err(err),
                    },
                    Ok(b' ') => return Ok(ExtensionMethod(String::from_str("CON"))),
                    Ok(b) if is_token_item(b) => ("CON", b),
                    Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                    Err(err) => return Err(err),
                },
                Ok(b' ') => return Ok(ExtensionMethod(String::from_str("CO"))),
                Ok(b) if is_token_item(b) => ("CO", b),
                Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                Err(err) => return Err(err),
            },
            Ok(b' ') => return Ok(ExtensionMethod(String::from_str("C"))),
            Ok(b) if is_token_item(b) => ("C", b),
            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
            Err(err) => return Err(err),
        },
        Ok(b'D') => match stream.read_byte() {
            Ok(b'E') => match stream.read_byte() {
                Ok(b'L') => match stream.read_byte() {
                    Ok(b'E') => match stream.read_byte() {
                        Ok(b'T') => match stream.read_byte() {
                            Ok(b'E') => match stream.read_byte() {
                                Ok(b' ') => return Ok(Delete),
                                Ok(b) if is_token_item(b) => ("DELETE", b),
                                Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                                Err(err) => return Err(err),
                            },
                            Ok(b' ') => return Ok(ExtensionMethod(String::from_str("DELET"))),
                            Ok(b) if is_token_item(b) => ("DELET", b),
                            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                            Err(err) => return Err(err),
                        },
                        Ok(b' ') => return Ok(ExtensionMethod(String::from_str("DELE"))),
                        Ok(b) if is_token_item(b) => ("DELE", b),
                        Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                        Err(err) => return Err(err),
                    },
                    Ok(b' ') => return Ok(ExtensionMethod(String::from_str("DEL"))),
                    Ok(b) if is_token_item(b) => ("DEL", b),
                    Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                    Err(err) => return Err(err),
                },
                Ok(b' ') => return Ok(ExtensionMethod(String::from_str("DE"))),
                Ok(b) if is_token_item(b) => ("DE", b),
                Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                Err(err) => return Err(err),
            },
            Ok(b' ') => return Ok(ExtensionMethod(String::from_str("D"))),
            Ok(b) if is_token_item(b) => ("D", b),
            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
            Err(err) => return Err(err),
        },
        Ok(b'G') => match stream.read_byte() {
            Ok(b'E') => match stream.read_byte() {
                Ok(b'T') => match stream.read_byte() {
                    Ok(b' ') => return Ok(Get),
                    Ok(b) if is_token_item(b) => ("GET", b),
                    Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                    Err(err) => return Err(err),
                },
                Ok(b' ') => return Ok(ExtensionMethod(String::from_str("GE"))),
                Ok(b) if is_token_item(b) => ("GE", b),
                Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                Err(err) => return Err(err),
            },
            Ok(b' ') => return Ok(ExtensionMethod(String::from_str("G"))),
            Ok(b) if is_token_item(b) => ("G", b),
            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
            Err(err) => return Err(err),
        },
        Ok(b'H') => match stream.read_byte() {
            Ok(b'E') => match stream.read_byte() {
                Ok(b'A') => match stream.read_byte() {
                    Ok(b'D') => match stream.read_byte() {
                        Ok(b' ') => return Ok(Head),
                        Ok(b) if is_token_item(b) => ("HEAD", b),
                        Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                        Err(err) => return Err(err),
                    },
                    Ok(b' ') => return Ok(ExtensionMethod(String::from_str("HEA"))),
                    Ok(b) if is_token_item(b) => ("HEA", b),
                    Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                    Err(err) => return Err(err),
                },
                Ok(b' ') => return Ok(ExtensionMethod(String::from_str("HE"))),
                Ok(b) if is_token_item(b) => ("HE", b),
                Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                Err(err) => return Err(err),
            },
            Ok(b' ') => return Ok(ExtensionMethod(String::from_str("H"))),
            Ok(b) if is_token_item(b) => ("H", b),
            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
            Err(err) => return Err(err),
        },
        Ok(b'O') => match stream.read_byte() {
            Ok(b'P') => match stream.read_byte() {
                Ok(b'T') => match stream.read_byte() {
                    Ok(b'I') => match stream.read_byte() {
                        Ok(b'O') => match stream.read_byte() {
                            Ok(b'N') => match stream.read_byte() {
                                Ok(b'S') => match stream.read_byte() {
                                    Ok(b' ') => return Ok(Options),
                                    Ok(b) if is_token_item(b) => ("OPTIONS", b),
                                    Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                                    Err(err) => return Err(err),
                                },
                                Ok(b' ') => return Ok(ExtensionMethod(String::from_str("OPTION"))),
                                Ok(b) if is_token_item(b) => ("OPTION", b),
                                Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                                Err(err) => return Err(err),
                            },
                            Ok(b' ') => return Ok(ExtensionMethod(String::from_str("OPTIO"))),
                            Ok(b) if is_token_item(b) => ("OPTIO", b),
                            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                            Err(err) => return Err(err),
                        },
                        Ok(b' ') => return Ok(ExtensionMethod(String::from_str("OPTI"))),
                        Ok(b) if is_token_item(b) => ("OPTI", b),
                        Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                        Err(err) => return Err(err),
                    },
                    Ok(b' ') => return Ok(ExtensionMethod(String::from_str("OPT"))),
                    Ok(b) if is_token_item(b) => ("OPT", b),
                    Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                    Err(err) => return Err(err),
                },
                Ok(b' ') => return Ok(ExtensionMethod(String::from_str("OP"))),
                Ok(b) if is_token_item(b) => ("OP", b),
                Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                Err(err) => return Err(err),
            },
            Ok(b' ') => return Ok(ExtensionMethod(String::from_str("O"))),
            Ok(b) if is_token_item(b) => ("O", b),
            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
            Err(err) => return Err(err),
        },
        Ok(b'P') => match stream.read_byte() {
            Ok(b'A') => match stream.read_byte() {
                Ok(b'T') => match stream.read_byte() {
                    Ok(b'C') => match stream.read_byte() {
                        Ok(b'H') => match stream.read_byte() {
                            Ok(b' ') => return Ok(Patch),
                            Ok(b) if is_token_item(b) => ("PATCH", b),
                            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                            Err(err) => return Err(err),
                        },
                        Ok(b' ') => return Ok(ExtensionMethod(String::from_str("PATC"))),
                        Ok(b) if is_token_item(b) => ("PATC", b),
                        Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                        Err(err) => return Err(err),
                    },
                    Ok(b' ') => return Ok(ExtensionMethod(String::from_str("PAT"))),
                    Ok(b) if is_token_item(b) => ("PAT", b),
                    Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                    Err(err) => return Err(err),
                },
                Ok(b' ') => return Ok(ExtensionMethod(String::from_str("PA"))),
                Ok(b) if is_token_item(b) => ("PA", b),
                Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                Err(err) => return Err(err),
            },
            Ok(b'O') => match stream.read_byte() {
                Ok(b'S') => match stream.read_byte() {
                    Ok(b'T') => match stream.read_byte() {
                        Ok(b' ') => return Ok(Post),
                        Ok(b) if is_token_item(b) => ("POST", b),
                        Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                        Err(err) => return Err(err),
                    },
                    Ok(b' ') => return Ok(ExtensionMethod(String::from_str("POS"))),
                    Ok(b) if is_token_item(b) => ("POS", b),
                    Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                    Err(err) => return Err(err),
                },
                Ok(b' ') => return Ok(ExtensionMethod(String::from_str("PO"))),
                Ok(b) if is_token_item(b) => ("PO", b),
                Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                Err(err) => return Err(err),
            },
            Ok(b'U') => match stream.read_byte() {
                Ok(b'T') => match stream.read_byte() {
                    Ok(b' ') => return Ok(Put),
                    Ok(b) if is_token_item(b) => ("PUT", b),
                    Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                    Err(err) => return Err(err),
                },
                Ok(b' ') => return Ok(ExtensionMethod(String::from_str("PU"))),
                Ok(b) if is_token_item(b) => ("PU", b),
                Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                Err(err) => return Err(err),
            },
            Ok(b' ') => return Ok(ExtensionMethod(String::from_str("P"))),
            Ok(b) if is_token_item(b) => ("P", b),
            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
            Err(err) => return Err(err),
        },
        Ok(b'T') => match stream.read_byte() {
            Ok(b'R') => match stream.read_byte() {
                Ok(b'A') => match stream.read_byte() {
                    Ok(b'C') => match stream.read_byte() {
                        Ok(b'E') => match stream.read_byte() {
                            Ok(b' ') => return Ok(Trace),
                            Ok(b) if is_token_item(b) => ("TRACE", b),
                            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                            Err(err) => return Err(err),
                        },
                        Ok(b' ') => return Ok(ExtensionMethod(String::from_str("TRAC"))),
                        Ok(b) if is_token_item(b) => ("TRAC", b),
                        Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                        Err(err) => return Err(err),
                    },
                    Ok(b' ') => return Ok(ExtensionMethod(String::from_str("TRA"))),
                    Ok(b) if is_token_item(b) => ("TRA", b),
                    Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                    Err(err) => return Err(err),
                },
                Ok(b' ') => return Ok(ExtensionMethod(String::from_str("TR"))),
                Ok(b) if is_token_item(b) => ("TR", b),
                Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
                Err(err) => return Err(err),
            },
            Ok(b' ') => return Ok(ExtensionMethod(String::from_str("T"))),
            Ok(b) if is_token_item(b) => ("T", b),
            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
            Err(err) => return Err(err),
        },
        Ok(b) if is_token_item(b) => ("", b),
        Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
        Err(err) => return Err(err),
    };
    // OK, that didn't pan out. Let's read the rest and see what we get.
    let mut s = String::from_str(s);
    s.push(next_byte as char);
    loop {
        match stream.read_byte() {
            Ok(b) if b == SP => return Ok(ExtensionMethod(s)),
            Ok(b) if is_token_item(b) => {
                if s.len() == MAX_METHOD_LEN {
                    // Too long; bad request
                    return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "too long, bad request", detail: None });
                }
                s.push(b as char);
            },
            Ok(_) => return Err(::std::io::IoError { kind: ::std::io::OtherIoError, desc: "bad value", detail: None }),
            Err(err) => return Err(err),
        }
    }
}
}
