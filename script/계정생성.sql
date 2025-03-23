-- 계정 생성
CREATE USER 'study'@'%' IDENTIFIED BY ;
CREATE USER 'bm'@'%' IDENTIFIED BY ;

GRANT ALL PRIVILEGES ON study.* TO 'study'@'%';
GRANT ALL PRIVILEGES ON bm.* TO 'bm'@'%';
