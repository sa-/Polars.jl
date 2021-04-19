pub use polars;

use std::ffi::{CStr};
use std::os::raw::c_char;


#[no_mangle]
pub extern fn greet(person: Person) {
    let cstr = unsafe { CStr::from_ptr(person.name) };

    let s = cstr.to_str().ok().unwrap();
    println!("Hello, {}, {}", s, person.age);
}

#[repr(C)]
pub struct Person {
    name: *const c_char,
    age: i64
}