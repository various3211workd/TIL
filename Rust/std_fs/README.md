# std::fs

### mkdir [folder_name]
```rust
match fs::create_dir("a") {
  Err(why) => println!("! {:?}", why.kind()),
  Ok(_) => {},
}
```

