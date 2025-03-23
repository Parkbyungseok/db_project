#서브쿼리 과제
select * from book;

#1번
select title
from rent_master m
join rent_book b on(m.rm_idx = b.rm_idx)
where b.reg_date = '2023-06-18';

select title
from rent_master rm
join rent_book rb using (rm_idx)
where rb.reg_date = '2023-06-18';

#2번
select author
from book
where reg_date = '2023-06-30';

select title
from book
where reg_date = '2023-06-28' and rent_cnt >1;

select title
from book;