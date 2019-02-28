# 秒杀项目
## 准备步骤
 - 导入工程
 - 启动mysql数据库，导入数据库脚本，脚本路径：miaosha/src/resources/sql
 - 启动redis、rabbitmp
 - 打开配置文件配置连接参数
 - 运行MainApplication.java(springboot右键run main方法即可)
## 启动reids,本机redis
C:\Users\jj>cd F:\Dev\redis-2.8
C:\Users\jj>F:
F:\Dev\redis-2.8>redis-server.exe redis.windows.conf
## 启动mysql、rabbitmq,并配置连接参数，配置文件：application.properties
