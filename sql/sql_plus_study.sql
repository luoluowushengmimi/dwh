--sql 命令补充学习指南

--1. 创建表
  --以一张表的内容创建另外一张表
--(创建的是表的结构而没有表的内容)
create table tab_new like tab_old
--创建了表的结构的同时也复制了表的内容
create table order_test_tmp as select * from order_test;

