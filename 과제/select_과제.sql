#1번
select bk_idx, isbn, title, rent_cnt
from book
where rent_cnt >=20;

#2번
select bk_idx, isbn, title, reg_date
from book
where reg_date >'2020-06-20';

#3번
select bk_idx, isbn, title, rent_cnt
from book
where category = 'B001' and rent_cnt =8;

#4번
select bk_idx, isbn, title, author
from book
where author like '혜민%';

#5번
select title
from book
where title like '%소설%';

#6번
select bk_idx, isbn, title, author, rent_cnt
from book
where reg_date < '2020-04-15' and rent_cnt <=10;

#7번
select bk_idx, isbn, title, author, rent_cnt
from book
where title like '나는%';

#8번
select category, avg(rent_cnt) as '평균 대출건수', sum(rent_cnt) as '총 대출건수'
from book
group by category
order by category asc;

#9번
select bk_idx, isbn, title, author, rent_cnt
from book
order by rent_cnt desc
limit 5;

#10번
select bk_idx, isbn, category ,title, author, reg_date
from book
where category ='B002'
order by reg_date desc;

#11번
select user_id, password, email, grade,tell,is_leave
from member
where grade = 'role_user'
order by user_id asc;

#12번
select user_id, password, email, grade,tell,is_leave
from member
where grade = 'role_admin' and is_leave = 0;

#13번
select grade, count(grade) as COUNT
from member
group by grade;

#14번
select user_id , password, email, grade, tell ,is_leave
from member
where grade = 'ROLE_USER' and tell like '____________9%';

#15번
select email
from member
where is_leave = 0 and grade ='ROLE_ADMIN';

#16번
select user_id, password, email, grade, tell,is_leave
from member
where grade = 'ROLE_USER' 
	and is_leave =0 
	and tell like '___%4%' 
	and user_id like 'E%';

#17번
select bd_idx, user_id, reg_date, title, content, view_cnt as 'view_count',is_del
from board
where title like '%철학%' or content like '%철학%';

#18번
select bd_idx, user_id, reg_date, title, content, view_cnt as 'view_count',is_del
from board
order by view_cnt desc
limit 10;

#19번
select bd_idx, user_id, reg_date, title, content
from board
where user_id = 'Socrates' and view_cnt >=30;

#20번
select bk_idx, title, author,
	case
		when category like 'B0%' then '문학'
		when category like 'B1%' then '전문서적'
	end as '대분류'
from book;

#21번 
select rb_idx, rm_idx, bk_idx, reg_date , state,return_date
from rent_book
where state = 'RE01';

#22번
select title 
from rent_master
where rent_book_cnt>=2;

#23번
select * from book;
select bk_idx, isbn, title, reg_date
from book
where reg_date between'2020-06-25' and '2020-06-30';

#24번
#문제 틀림 11월 퇴사 x 12월 o
select user_id, reg_date, login_date, modify_date, leave_date
from member_info
where leave_date between '2023-12-01' and '2023-12-30';















