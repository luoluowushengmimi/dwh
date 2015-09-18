--sql 命令补充学习指南

--1. 创建表
  --以一张表的内容创建另外一张表
--(创建的是表的结构而没有表的内容)
create table tab_new like tab_old
--创建了表的结构的同时也复制了表的内容
create table order_test_tmp as select * from order_test;
--创建表时增加主键并且要求它自增
create table tablename (id not null auto increment,name varchar(20),primary key(id));
#这样的条件下创建的表应当这样插入数据
	insert into user_tmp(name,subname) values('qu','guodong');

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

--update变换数据内容

update table set columnname='' where columnname='';

--更为高级的数据更新工作，例如引入case条件，进行条件判断
update table 
	set category=
	case 
	when drama='T' then 'drama'
	when comedy='T' then 'comedy'
	when action='T' then 'action'
	when gore='T' then 'gore'
	when scifi='T' then 'scifi'
	else 'misc'
	end;



--alter修改表的结构

--增加字段
Alter table tabname add primary key(ID)；
--删除字段
Alter table tablename drop primary key(ID)；
--修改表名
alter table tablename rename newname;
--修改表的列的名字和类型
alter table tablename change column columnname newname int not null ;
--如果保留列名但是想要修改列的类型时
alter table tablename modify column int not null ;




















