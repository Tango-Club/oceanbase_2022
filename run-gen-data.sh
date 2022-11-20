tools/tpch-tools/bin/build-tpch-dbgen.sh
tools/tpch-tools/bin/gen-tpch-data.sh -s 1 -c 1
load data infile "/root/oceanbase_2022/tools/tpch-tools/bin/tpch-data/lineitem.tbl" into table lineitem_bulk fields terminated by "|";