# First Grep: Part II

## 問題
> 

## 解答
アクセスすると大量のフォルダが見つかる

grepに再帰的に探させればいい

```
99999@pico-2019-shell1:/problems/first-grep--part-ii_6_84224d7d745e41d24bde7e7bc7062bbe/files$ ls
files0  files10  files3  files5  files7  files9
files1  files2   files4  files6  files8
99999@pico-2019-shell1:/problems/first-grep--part-ii_6_84224d7d745e41d24bde7e7bc7062bbe/files$ grep -lr "pico" .
./files2/file24
99999@pico-2019-shell1:/problems/first-grep--part-ii_6_84224d7d745e41d24bde7e7bc7062bbe/files$ cd files2/
99999@pico-2019-shell1:/problems/first-grep--part-ii_6_84224d7d745e41d24bde7e7bc7062bbe/files/files2$ cat file24 | grep "pico"
picoCTF{grep_r_to_find_this_5241c61f}
```