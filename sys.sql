select username
from all_users
order by username;

alter session set "_ORACLE_SCRIPT"=true;

-- scott 계정생성
create user scott
identified by tiger
default tablespace users
temporary tablespace temp;

GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE
TO scott;

GRANT CREATE VIEW TO scott;

-- hr계정 생성
create user hr
identified by hr
default tablespace users
temporary tablespace temp;

GRANT CONNECT, RESOURCE, create view, UNLIMITED TABLESPACE
TO hr;

SELECT *
FROM tab;

SELECT *
FROM dba_users
WHERE username = 'SCOTT';

SELECT username, COUNT(*) FROM v$session GROUP BY username;
