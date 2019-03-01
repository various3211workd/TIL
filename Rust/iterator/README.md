# iterator

## 要素の取りだし

```rust
//配列要素の取り出し
let cpus = vec!["sh", "x86", "arm", "mips"];

//getで取り出す。
let second_cpu = cpus.get(1);
if let Some(second_cpu) = second_cpu {
  println!("second spu = {}", second_cpu);
}

//no check
let first_cpu = cpus[0];
println!("first cpu = {}", first_cpu);
```
## 重複の削除

dedup()を使うと、連続する重複する要素が1つにまとめられます。完全に重複を無くしたい場合は、sort()してから、dedup()を使います。
```rust
//重複の削除
let mut nums = vec![1, 2, 2, 2, 3, 3, 4, 5, 1, 5];
nums.dedup();
// deduped [1, 2, 3, 4, 5, 1, 5]

let mut nums = vec![1, 2, 2, 2, 3, 3, 4, 5, 1, 5];
nums.sort();
nums.dedup();
//deduped [1, 2, 3, 4, 5]
```
## 分割と結合

split_off()で分割して、append()で結合します。所有権も上手くやってくれます。
```rust
let mut cpus = vec!["sh", "x86", "arm", "mips"];
let mut later = cpus.split_off(2);
//cpus = ["sh", "x86"], later = ["arm", "mips"]

cpus.append(&mut later);
println!("cpus = {:?}, later = {:?}", cpus, later);
//cpus = ["sh", "x86", "arm", "mips"], later = []
```
### retain

配列から特定の要素だけを取り出します。何気に破壊的操作です。
```rust
//retain
let mut cpus = vec!["sh", "x86", "sh2", "sh4", "arm", "mips"];
cpus.retain(|name| name.starts_with("sh"));
//cpus = ["sh", "sh2", "sh4"]
```
### drain

配列から要素を取り出したら、そのまま削除して欲しいときに使います。キュー的なアルゴリズムで活躍しそうです。

下の例は、配列cpusから先頭から二つを取り出して何かに使った後、取り出した分だけが配列から削除されます。
```rust
//drain
let mut cpus = vec!["sh", "x86", "sh2", "sh4", "arm", "mips"];
for cpu in cpus.drain(..2) {
  println!("use {}", cpu);
}
println!("cpus {:?}", cpus);
//cpus ["sh2", "sh4", "arm", "mips"]
```
### swap_remove

Rustっぽい面白い操作です。通常、配列から要素を一つ削除すると、削除した後の要素をコピーして空白を埋める必要があります。swap_removeを使うと、削除した場所に最後の要素を入れて配列の大きさを一つ小さくすることで、要素のコピーを防ぎます。

下の例では、2を取り出して削除した後、空いた場所に配列の最後の要素6を入れることで、配列のコピーを防いでいます。

```rust
let mut nums = vec![1, 2, 3, 4, 5, 6];
let second_num = nums.swap_remove(1);
println!("nums = {:?}, second_num = {}", nums, second_num);
```

## 参考
http://natsutan.hatenablog.com/entry/2018/11/19/182233
