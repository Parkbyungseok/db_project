# function 
# 1. 문자 관련 함수
# length, char_length, substr, concat, replace, trim, lpad, rpad

#1. length
select length('text');
#한글은 글자당 3byte
select length('텍스트');

#2. substr
select substr('programmers', 2);
select substr('programmers', 2,5);

select substr('programmers' from 2);
select substr('programmers' from 2 for 5);

# employee 테이블에서 남자인 직원을 조회하시오
# 남자 여부 주민등록번호의 8번째 자리가 1 또는 3
select emp_name, emp_no
from employee
where substr(emp_no,8,1) in('1','3');

# concat - 문자 연결
select concat('pro','gram', 'mers');

# concat_ws(with separator) - 구분자를 통해 연결
select concat_ws('!','pro','gram', 'mers');

# instr - 특정 인자 전달하면 위치 반환
select instr('programmers', 'r');

# locate 
select locate('r', 'programmers');
select locate('r', 'programmers', 6); #6번째 이후로 r 찾기

# replace
# replace(str, from str, to str)
select replace('programmers', 'mers', '!');

#trim
select length(trim('             programmers     ')),trim('             programmers     ');

select trim(leading 'x' from 'xxxprogramerxxx');
select trim(trailing 'x' from 'xxxprogramerxxx');
select trim('x' from 'xxxprogramerxxx');

#lpad, rpad
select lpad('program', 11, 'hi');
select rpad('program', 11, 'mers');
select lpad('program', 11, ' ');

# employee 테이블에서 사원명과 주민번호를 조회하시오.
# 단 주민번호 뒤 8자리 *로 마스킹처리
select concat(substr(emp_no,1,7), '********')
from employee;

select emp_name, 
replace(emp_no, substr(emp_no,8),'********')
from employee;

select emp_name,
rpad(substr(emp_no,1,7),14,'*')
from employee;

# 숫자 관련 함수 
# abs, mod, floor, ceil, round, truncate

# abs 절대값
select abs(-22);

 # mod 나머지
select mod(777,10);

# floor 내림
select floor(99.99999); 
select floor(-99.99999);

# ceil 올림
select ceil(99.99999); 
select ceil(-99.99999);

# round 반올림
select round(99.99);
select round(93.99, -1);

# truncate 소수점 이하를 버리는 기능
select truncate(87.001,0);
select truncate(87.001,-1);

# 날짜 관련함수
# now, datediff, date_add, date_sub, year, month, date
# from dual이라는 가상 테이블에서 가져옴

# 현재 날짜 시간
select now();
select sysdate();
select curdate();

# datediff
# employee 테이블에서 사원들의 근무일자를 조회
select emp_name, datediff(now(), hire_date) as '근속일자'
from employee
where ent_yn = 'N';

# date_add
select date_add(now(), interval 1 day);

# 현재 시간에서 5분 10.0001초를 더한 시간 구하기
select date_add(now(), interval '5:10.0001' minute_microsecond);

# date_sub
select date_sub(now(), interval 1 day);

# 현재 시간에서 5분 10.0001초를 뺀 시간 구하기
select date_sub(now(), interval '5:10.0001' minute_microsecond);

select now(),
year(now()),
month(now()),
DAYOFWEEK(now()),
hour(now()),
MINUTE(now()),
second(now());

# 형변환 함수(cast)
select cast('2025-03-21' as date) > '90-03-21';
select cast('2025-03-21' as datetime);
select cast('2025-03-21 1:1:1.111111' as datetime(3));
select cast('9999.99' as double);
select cast('9999.99' as decimal(6,2));
select cast('1979년' as year);

#case-when-then
#case
#when 조건식 then 표현식
#...
#else 표현식
#end 별칭

#급여레벨
select emp_name,salary,
case
	when salary >= 6000000 and salary <= 10000000 then 'S1'
	when salary >= 5000000 then 'S2'
	when salary >= 4000000 then 'S3'
	when salary >= 3000000 then 'S4'
	when salary >= 2000000 then 'S5'
	when salary >= 1000000 then 'S6'
	else 'S7'
end as '급여레벨'
from employee;



