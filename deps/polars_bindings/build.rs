// cbindgen --crate polars_bindings --output c_headers/polars_bindings.h --lang c

extern crate cbindgen;

use std::env;

fn main() {
    let crate_dir = env::var("CARGO_MANIFEST_DIR").unwrap();

    if env::var("PROFILE").unwrap()=="release" {
        cbindgen::Builder::new()
           .with_crate(crate_dir)
           .with_language(cbindgen::Language::C)
           .generate()
           .expect("Unable to generate bindings")
           .write_to_file("c_headers/polars_bindings.h");
    }
}