--sql 命令补充学习指南

--1. 创建表
  --以一张表的内容创建另外一张表
--(创建的是表的结构而没有表的内容)
create table tab_new like tab_old
--创建了表的结构的同时也复制了表的内容
create table order_test_tmp as select * from order_test;

--修改一张表
alter table order_test_tmp add column name varchar(10);




--查询一张表

--1 字段内容在指定范围30-50之间
select * from table  where column between 30 and 50;

--2 字段在指定的范围'里面

select * from table where column in('ca','beijing','shanghai','tibet');

--3 查询不在范围里面的内容

select * from table where column not in('ca','beijing','shanghai','tibet');

--4 not 可以与between连用

select * from table where Not column between 30 and 50;

--5 not 也可以和like一起连用

select * from table where not column like '%gao';

--6 not 也可以与is null一起连用

select * from table where  not column is null;

select * from table where column is not null;


--删除表中的行

delete from table where column='';



--update变换数据

update table set columnname='' where columnname='';
















