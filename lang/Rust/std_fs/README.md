# std::fs

### mkdir [folder_name]
```rust
match fs::create_dir("a") {
  Err(why) => println!("! {:?}", why.kind()),
  Ok(_) => {},
}
```

### OpenOption
```rust
use std::fs::OpenOptions;

let file = OpenOptions::new()
  .write(true)
  .create(true)
  .truncate(true)
  .open("foo.txt");
```
### pathbuf
```rust
// "str"
current_dir().unwrap()

// str
current_dir().unwrap().display()
```