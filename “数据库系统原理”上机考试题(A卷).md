# “数据库系统原理”上机考试题(A卷)

* 姓名                 学号                 专业                  
答案以Word文件的方式提交，文件名为“学号_姓名.doc”。每个题目的SQL语句都必须在查询分析器中调试，运行无误后提交查询的SQL语句（文字）和查询结果（截图），注意：查询结果集中的列名必须采用查询需求中给出的列名。

* 数据库模式如下：
图书类别（类别编号，类别名， 藏书数目）
图书（图书编号，书名，作者，价格，类别编号）
学生（学号，姓名， 学生类别）
借书情况（学号，图书编号，借书日期）

* 注：上面数据仅供参考，具体的SQL语句不应该和具体的数据有关

 
1.给出作者为”科曼”的图书信息（图书编号，图书名，价格）
```sql
select bookid as '编号',bookname as '图书名',price as '价格'
from book
where author='科曼'
```
2.给出跟经济学有关的图书的所有信息（书名中包含“经济学”）。（bookid，bookname，author，price，catid）
```sql
select *
from book
where bookname like '%经济学%'
```
3.给出图书类别编号为“c2”且图书编号最小的那本书。（bookid，bookname，author）
```sql
select *
from book
where catid='c2'
and bookid<=all(select bookid from book where catid='c2')
```
4.请列出”经济”类被借阅的图书的信息(bookid, bookname，borrowdate)
```sql
select book.bookid,bookname,borrowdate
from borrow
inner join book on borrow.bookid=book.bookid
join category on book.catid=category.catid
where catname='经济'
```
5.给出所有研究生借阅图书的数目(category，num)
```sql
select catname 'category', count(*) 'num'
from student
inner join borrow on student.stuid=borrow.stuid
left join book on borrow.bookid=book.bookid
left join category on book.catid=category.catid
where degree='研究生'
group by catname
```
6.给出学号为“200810111”的同学最近一次借阅（借阅日期最大）的图书信息（bookid，bookname）
```sql
select top(1) book.bookid,book.bookname
from student
left join borrow on student.stuid=borrow.stuid
left join book on borrow.bookid=book.bookid
where student.stuid='200810111'
order by borrowdate desc
```
7.给出在[2010-10-1,2010-10-20]这段期间被借阅次数超过两次的图书信息，结果按图书编号从小到大排序（bookid,bookname,author）
```sql
select book.bookid,bookname,author
from borrow 
left join book on borrow.bookid=book.bookid
where borrowdate between '2010-10-1' and '2010-10-20'
group by book.bookid,book.bookname,book.author
having count(*)>2
order by book.bookid asc
```
8.给出借阅了所有图书类别的学生（stuid,stuname)
```sql
select student.stuid,stuname
from student
left join borrow on student.stuid=borrow.stuid
left join book on borrow.bookid=book.bookid
group by student.stuid,stuname
having count(distinct catid)=(select count(distinct catid) from book)
```
9.李飞同学弄丢了他在2010年10月9号（含当天）以后借的所有书，若已知计算机技术类图书原价3倍赔偿，其它类图书按原价2倍赔偿，给出他需要赔偿的钱数（赔偿数额）
```sql
select sum(sumprice)
from
(select student.stuid,case when catname='计算机技术' then price*3 else price*2 end as 'sumprice'
from student
left join borrow on student.stuid=borrow.stuid
inner join book on borrow.bookid=book.bookid
inner join category on category.catid=book.catid
where student.stuname='李飞' and borrowdate>='2010-10-9') A
group by stuid
```
10.给出借阅“c1”类别图书次数最多的学生。（stuid，stuname，borrowcount）
```sql
select student.stuid ,count(borrowdate) as 'borrowcount'
from student
left join borrow on student.stuid=borrow.stuid
left join book on borrow.bookid=book.bookid
where book.catid='c1' 
group by student.stuid
having count(borrowdate)=
(
select max(a)
from (select count(borrowdate) 'a'
from student
left join borrow on student.stuid=borrow.stuid
left join book on borrow.bookid=book.bookid
where book.catid='c1' 
group by student.stuid) A
)
```
