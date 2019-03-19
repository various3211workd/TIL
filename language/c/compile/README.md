# compile

## cl
#### ASLRを無効
```
cl ***.c /link /dynamicbase:no
```

#### stack canaryを無効
```
$ cl ***.c /GS- 
```
