# “数据库系统原理”上机考试题(B卷)
* 姓名                 学号                 专业                  
答案以Word文件的方式提交，文件名为“学号_姓名.doc”。每个题目的SQL语句都必须在查询分析器中调试，运行无误后提交查询的SQL语句（文字）和查询结果（截图），注意：查询结果集中的列名必须采用查询需求中给出的列名。

* 数据库模式如下：
图书类别（类别编号，类别名， 藏书数目）
图书（图书编号，书名，作者，价格，类别编号）
学生（学号，姓名， 学生类别）
借书情况（学号，图书编号，借书日期）

* 注：上面数据仅供参考，具体的SQL语句不应该和具体的数据有关

1.给出书名为”编译原理”的图书信息（图书编号，图书名，价格）
```sql
select bookid'图书编号',bookname'图书名',price'图书价格'
from book
where bookname='编译原理'
```
2.给出图书名以“概论”结尾的图书的所有信息。（bookid，bookname，author，price，catid）
```sql
select * 
from book
where bookname like '%概论'
```
3.给出图书类别编号为“c3”且图书编号最大的那本书。（bookid，bookname，author）
```sql
select top( 1) bookid,bookname,author
from book
where catid='c3'
order by bookid desc
```
4.请列出”数理科学”类被借阅的图书的信息(bookid, bookname，borrowdate)
```sql
select book.bookid,book.bookname,borrowdate
from borrow
left join book on borrow.bookid=book.bookid
left join category on book.catid=category.catid 
where catname='数理科学'
```
5.给出所有本科生借阅图书的数目(category，num)
```sql
select catname,count(borrowdate)'num'
from student
left join borrow on student.stuid=borrow.stuid
left join book on borrow.bookid=book.bookid
left join category on book.catid=category.catid
where degree='本科生'
group by degree,catname
```
6.给出学号为“200810111”的同学最早一次借阅（借阅日期最小）的图书信息（bookid，bookname） 	
```sql
select top(1) book.bookid,bookname
from borrow
left join book on borrow.bookid=book.bookid
where stuid='200810111'
order by borrowdate asc
```
7.给出在[2010-10-1,2010-11-1]这段期间内借阅的书籍多于两本的学生，结果按学生学号从大到小排序（stuid）
```sql
select stuid
from borrow
where borrowdate between '2010-10-1' and '2010-11-1'
group by stuid
having count(borrowdate)>2
```
8.给出被所有本科生都借阅过的图书(bookname,author)
```sql
select bookname,count(DISTINCT student.stuid)
from student
inner join borrow on student.stuid=borrow.stuid
inner join book on borrow.bookid=book.bookid 
where degree='本科生'
group by bookname
having count(DISTINCT student.stuid)=
(select count(*) from student where degree='本科生')
```
9.王玲同学弄丢了她在2010年10月8号（含当天）以后借的所有书，若已知计算机技术类图书每本100元赔偿，其它类图书按原价2倍赔偿，给出她需要赔偿的钱数（赔偿数额）
```sql
select sum(mny)
from 
(select case when catname='计算机技术' then 100 else 2*price end as 'mny'
from student
left join borrow on student.stuid=borrow.stuid
inner join book on borrow.bookid=book.bookid
inner join category on category.catid=book.catid
where stuname='王玲') as A
```
10.给出借阅“c1”类别图书总价格最高的学生。（stuid，stuname，totalprice）
```sql
select student.stuid,stuname,count(borrowdate) as 'totalnum',sum(price) as 'totalprice'
from borrow
inner join student on borrow.stuid=student.stuid
inner join book on borrow.bookid=book.bookid
where catid='c1'
group by student.stuid,stuname
having sum(price)>=all
(
select sum(price) as 'totalprice'
from borrow
inner join student on borrow.stuid=student.stuid
inner join book on borrow.bookid=book.bookid
where catid='c1'
group by student.stuid,stuname
)
```
