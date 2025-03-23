# subquery
# query 안의 query
# 노홍철 사원과 같은 부서인 직원의 명단을 조회하시오

select dept_code from employee where emp_name = '노옹철';
select dept_code from employee where dept_code = 'D9';

select * from employee;

# 서브쿼리의 분류
# 1. 사용 위치에 따른 분류
# select절 : 스칼라(단일 값) 서브쿼리
# from 절 : inline view
# where, having : subquery

# 2. 서브쿼리의 result set 형태에 따라 분류
# 단일행, 단일열, 다중행, 다중열

# 단일행 단일열 서브쿼리 
# 단일행 단일열 보장이 되지 않는다면? 오류 발생 so 단일행 단일열인지 확인해봐야함(중복제거 등으로 해결)
select emp_name 
from employee
where dept_code = (select dept_code from employee where emp_name = '노옹철');

# 다중행 단일열 서브쿼리
# in, all , exists
# 최대급여 4999999 이하인 급여등급에 속하는 모든 직원을 조회
select emp_name , salary
from employee
where sal_level in(
	select sal_level from sal_grade
	where max_sal <= 499999
);

# any - 서브쿼리 결과 중 하나라도 만족하는 경우를 찾을 때
# = > < <= >= !=
# 박나라와 같은 부서에 속한 사람들 중
# 가장 적은 연봉을 받는 사람보다는 많은 연봉을 받는 사람을 조회
select salary
from employee
where dept_code =(
	select dept_code
	from employee
	where emp_name ='박나라'
);

select emp_name, salary
from employee
where salary > any(
	select salary 
	from employee 
	where dept_code = (
		select dept_code
		from employee
		where emp_name ='박나라'
	)
);

# All (and)
# 단일열 다중행 서브쿼리가 반환하는 result set과
# 컬럼값을 비교연산하였을 때 모두 참이면 where절의 결과가 참
# where 1 > All(100,200,300,400,0.9) => false
# where 1 < All(100,200,300,400,12) => true
select emp_name, salary
from employee
where salary > all(
	select salary 
	from employee 
	where dept_code = (
		select dept_code
		from employee
		where emp_name ='박나라'
	)
);

# exists - 서브쿼리 결과가 하나라도 존재하면 true 실행
# 상관쿼리 (상호연관쿼리)
# 매니저인 사원을 조회
# 매니저인 사원 : 다른 row의 Manager_id에 자신의 emp_id가 등록되어있는 사원
select emp_name
from employee e
where exists(
	select emp_id from employee where manager_id = e.emp_id
);

# 다중열 서브쿼리
# 퇴사한 직원이 존재하는 부서의 사원 중에서
# 퇴사한 사원과 같은 직급인 사원의 이름, 직급, 부서를 조회하시오
select emp_name, job_code, dept_code
from employee
where dept_code in(select dept_code from employee where employee.ENT_Yn ='Y')
and job_code in(select job_code from employee where ent_yn = 'Y');

select emp_name, job_code, dept_code
from employee
where(dept_code,job_code) in(select dept_code, job_code from employee where ent_yn = 'Y'); 

# 인라인 뷰
# from절에서 사용하는 서브쿼리
# 반드시 별칭이 있어야 함
# 성능 이슈가 없음
select *
from (
	select emp_id, emp_name, job_code
	from employee where job_code = 'J6'
) e
where e.emp_name like '전%';


