# json

```rust
use serde_json::{Result, Value, json};

let mut jsontree = json!({});
  
for entry in WalkDir::new(".").into_iter()  .filter_map(|e| e.ok()) {
  if entry.file_name().to_string_lossy().ends_with(".md") {
    jsontree.push_str(&entry.path().display().to_string());
    jsontree.push_str("&");

    for x in entry.path().display().to_string().split('\\') {
      println!("{}", x);
    }
    jsontree = json!({
      f_name
    });
  }
}

```