pub use polars;

use std::ffi::{CStr};
use std::os::raw::c_char;


#[no_mangle]
pub extern fn greet(cstring: *const c_char) {
    let cstr = unsafe { CStr::from_ptr(cstring) };

    let s = cstr.to_str().ok().unwrap();
    println!("Hello, {}", s);
}
