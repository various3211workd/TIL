# termcolor

## colors
```rust
Variants
Black
Blue
Green
Red
Cyan
Magenta
Yellow
White
Ansi256(u8)
Rgb(u8, u8, u8)
```

## wincolor
Add this to your Cargo.toml:
```
[dependencies]
wincolor = "0.1"
```

and this to your crate root:
```rust
extern crate wincolor;
```

Usage
```rust
use wincolor::{Console, Color, Intense};

let mut con = Console::stdout().unwrap();
con.fg(Intense::Yes, Color::Cyan).unwrap();
println!("This text will be intense cyan.");
con.reset().unwrap();
println!("This text will be normal.");
```