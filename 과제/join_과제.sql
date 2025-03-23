# JOIN 과제

# 1번
-- content board , email - memeber
select b.user_id , email, reg_date, title, content
from board b
join member m on(b.user_id = m.user_id);

# 2번
select b.user_id , m.email, grade, b.title, b.content
from member m
join board b on (m.user_id = b.user_id)
where b.is_del = '0';

# 3번
select b.user_id, m.grade, title, content
from board b
join member m on (b.user_id = m.user_id)
where b.user_id = 'socrates';

# 4번
-- member
-- member_info
select m.user_id, email, grade
from member m
join member_info i on(m.user_id = i.user_id)
where i.leave_date between '2023-12-01' and '2023-12-31';

# 5번
-- rent_master
-- 대출횟수 3인데 왜 1인지 모르겠음
select user_id , rent_book_cnt as '대출횟수'
from rent_master
where title like '디디의 우산 :황정은 연작소설%';

# 6번
select rm_idx, user_id, reg_date, title
from rent_master
where reg_date > '2023-06-10';

# 7번
select rm_idx, r.user_id, title, reg_date
from rent_master r
join member m on(r.user_id = m.user_id)
where is_return = '0' and grade = 'ROLE_USER';

# 8번
select r.user_id , email , rent_book_cnt as '대출도서수'
from rent_master r
join member m on(r.user_id = m.user_id)
where rent_book_cnt >=2
order by rent_book_cnt desc;

# 9번 답이 다른데 틀린 부분을 모르겠음
select rb_idx, user_id, title, return_date
from rent_book r
join rent_master m on (r.rm_idx = m.rm_idx)
where datediff(return_date, m.reg_date) <=3;

# 10번
select r.user_id, email, rent_book_cnt
from rent_master r
join member m on(r.user_id = m.user_id)
order by rent_book_cnt desc
limit 1;

# 11번
select distinct m.rm_idx, m.user_id , m.title, b.reg_date,
CASE 
        WHEN m.is_return = '1' THEN '연체' 
        ELSE '반납' 
    END AS 'INFO'
FROM rent_master m
JOIN rent_book b ON m.rm_idx = b.rm_idx
where m.is_return = '1';

# 12번 ###################### RE03 존재 x
select r.rb_idx, user_id, title, r.return_date
from rent_book r
join rent_master m on(r.rm_idx = m.rm_idx)
where m.IS_RETURN ='1' and return_date < '2023-06-15';

# 13번 
select m.user_id, email
from member m
join rent_master rm on(m.user_id = rm.user_id)
where m.GRADE = 'role_user' and rm.IS_RETURN ='1';

# 14번
select m.rm_idx, m.user_id, title, b.reg_date
from rent_master m
join rent_book b on(m.rm_idx=b.rm_idx)
where b.STATE = 'RE01'
order by b.reg_date asc
limit 1;

# 15번
select category, c.info, sum(book_amt) as '도서재고량'
from book b
join code c on (b.CATEGORY  = c.code)
group by category, info;

# 16번 help
select distinct code , upper_code, c.info
from book b
left join code c on (b.CATEGORY = c.code);

#17번
select i.user_id , sum(rent_book_cnt) as 'ADMIN_RENT_COUNT'
from member_info i
join rent_master m on (i.user_id = m.user_id)
where i.LOGIN_DATE between '2023-12-01' and '2023-12-31'
group by user_id;


#18번
select sum(rent_book_cnt) as 'overdue_count'
from rent_master
where is_return ='1';

#19번 이상함 애초에 로맨스 판타지가 존재 x
#right로 하기에도 애매함
select sum(book_amt) as '도서재고', c.info
from book b
left join code c on(b.CATEGORY =c.code)
group by category, c.info;

#20번 help 조인 2번?
SELECT 
    b.title, 
    c.info AS 카테고리,
    oc.info AS 상위카테고리
FROM book b
JOIN code c ON b.CATEGORY = c.code
LEFT JOIN code oc ON c.upper_code = oc.code;





