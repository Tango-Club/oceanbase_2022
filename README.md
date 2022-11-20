# OceanBase 2022 final

### run-test-build.sh
运行此脚本完成编译，打包，部署，在OB内创建lineitem表。

### run-gen-data.sh
运行次脚本完成编译tpch数据生成器，并生成1g数据在`tools/tpch-tools/bin/tpch-data`。

### 其他
1. 进入ob客户端: `mysql -h127.0.0.1 -P2881 -uroot -Dtpch`(这里默认用mysql-client)
2. 导入操作
```sql
set global secure_file_priv = "";
 -- 执行换成后，退出客户端，再重新连接

 -- 设置导入超时时间。时间单位是"微秒"
set global ob_query_timeout=36000000000;
 -- 导入数据。需要调整文件路径
load data infile "xxx/tools/tpch-tools/bin/tpch-data" into table lineitem_bulk fields terminated by "|";
```

完成后验证数据量是否正确, 1G为6001215行。
```sql

MySQL [tpch]> select count(*) from lineitem_bulk;
+----------+
| count(*) |
+----------+
|  6001215 |
+----------+
1 row in set (0.005 sec)
```

### perf

perf record -p 9041 -e cycles -g --call-graph dwarf
perf report -g graph