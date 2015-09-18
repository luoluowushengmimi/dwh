create database EXAM go 
create table student 
(stuName varchar(10) not null, stuNO int primary key not null, 
stuSex char(2)check(stuSex='男'or stuSex='女'), stuAge int , stuSeat int , 
stuAddress varchar(40)  )  GO 
insert into student values('张秋丽','25301','女','21','1','北京海淀'),                            ('李文才','25302','男','25','2','天津'),                            ('张三','25303','男','22','3','北京海淀'),                            ('红尘','25304','女','21','4','湖南长沙'),                            ('段林希','25305','女','20','5','江西赣州'),                            ('魏晨','25306','男','23','6','河北石家庄'),                            ('郑爽','25307','女','20','7',''),                            ('张杰','25308','男','21','8',''), 
                           ('王洁','25309','女','23','9','湖南怀化'),                            ('刘欣','253010','女','21','10','北京')
create table exam   (ExamNO int primary key ,  stuNO int not null,  WrittenExam int,  LabExam int  )  GO   insert into exam values
               (01,250301,86,89),                          
               (02,250302,67,78),                          
               (03,250303,76,80),                          
               (04,250304,79,56),                         （05,250305,56,63),                          
               (06,250306,67,60),                          
               (07,250307,90,83),                          
               (08,250308,80,79),                          
               (09,250309,92,90),                          (10,250310,55,58)

--统计并显示本班笔试平均分，如果平均分在以上，显示“成绩优秀“，并显示前三名学员的考试信息；如果在以下，显示“本班成绩较差“，并显示后三名学员的考试信息。    
  Declare @myavg float  --声明一个变量 
  select @myavg=AVG(writtenExam) from exam   
      print '本班平均分'+convert(varchar(5),@myavg) if (@myavg>70)     
      begin 
              print'本班笔试成绩优秀，前三名的成绩为：'   
              select top 3 *from exam order by writtenExam DESC   
end ELSE    
     begin 
     print'本班成绩较差，后三名的成绩为：' 
     select top 3*from exam   order by writtenExam         
end 


--本次考试成绩较差，假定要提分，确保每人笔试都通过。提分规则很简单，先每人都加分，看是否都通过，如果没有全部通过，每人再加分，再看是否都通过，如此反复提分，直到所有人都通过为止

Begin tran     --开始一个事务   
Declare @n int
while (1=1)  --条件永远成立 begin 
    select @n=count(*)from exam  
             where writtenExam<60           --统计不及格人数  if(@n>0)                 update exam 
       set writtenExam=writtenExam+2   --全部加分  else 
     break   --推出循环 end 
  print'加分后的成绩：'   select*from exam 
Commit tran     --提交事务 
Rollback tran   --回滚事务 



--采用ABCDE五级打分制来显示笔试成绩。  --A级:   90分以上  --B级：80－分  --C级:   70－分  --D级：60－分  --E级：60分以下 
--用到的就是CASE--WHEN--  
PRINT '分级后的成绩显示如下：' 
select stuNO, 
      成绩=case 
                when writtenExam<60 then 'E' 
                when writtenExam between 60 and 70 then 'D'                              
                when writtenExam between 70 and 80 then 'C'                  
                when writtenExam between 80 and 90 then 'B'            
                else   'A'      
      end  
 from exam

 --请根据平均分和下面的评分规则，编写T-SQL语句查询学员的成绩，如上图所示。 --      优：分以上 --      良：－分 --      中：－分 --      差：－分 --      不及格：分以下   


SELECT 考号=ExamNO,学号=stuNO,笔试=writtenExam,机试=labExam,   平均分=(writtenExam+labExam)/2,   
等级=CASE   
       WHEN (writtenExam+labExam)/2<60 THEN '不及格' 
       WHEN (writtenExam+labExam)/2 BETWEEN 60 AND 69 THEN '差'        
       WHEN (writtenExam+labExam)/2 BETWEEN 70 AND 79 THEN '中'        
       WHEN (writtenExam+labExam)/2 BETWEEN 80 AND 89 THEN '良'        
ElSE '优'      
END  
 FROM exam 



