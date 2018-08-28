# spark

本项⽬是通过 Docker 镜像来构建分布式集群，⼀个主节点，两个从结点。

## 使用 spark

> 所有的功能写成了如下脚本。

### spark 相关脚本介绍

- `bash ./initial-spark.sh`：初始化 spark 环境，只能初始化一次，重新初始化之前需要删除 spark 环境。
- `bash ./start-spark.sh`：启动 spark 环境，后台启动，不会有任何反应。
- `bash ./stop-spark.sh`：停用 spark 环境。
- `bash ./delete-spark.sh`：删除 spark 环境。
- `bash ./pyspark-shell.sh`：在完成初始化和启动 spark 环境后，执行此命令可以启动 pyspark 交互式窗口。

### pyspark 交互式

1. 在命令行中，进入本文件夹所在的目录。
2. 执行 `bash ./initial-spark.sh`，初始化环境 **（第一次下载安装包等待时间较长）**，然后执行 `bash ./start-spark.sh`，启动 spark 环境，接着执行 `bash ./pyspark-shell.sh`，直接进入了 pyspark 交互式窗口，此处配置的 `python3` 版本，使用 `ipython` 接口。
3. 执行结束了，可以执行 `bash ./stop-spark.sh` 来停用 spark 环境或者执行  `bash ./delete-spark.sh` 来删除 spark 环境。

由于 `pyspark` 是交互式执⾏行行的界⾯面，启动是已经帮你创建好了了会话 `SparkContext` ，所以可以直接使 ⽤用 `sc`。

`ipython` 里，可以使⽤用 `tab` 来⾃自动补全。

### 数据⽂件

将需要的数据⽂件放在本项目的 `/data` 目录下，在 `pyspark` 交互中，目录同样在 `/data` 下。
