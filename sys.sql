select username
from all_users;

alter session set "_ORACLE_SCRIPT"=true;

create user scott
identified by tiger
default tablespace users
temporary tablespace temp;

GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE
TO scott;

GRANT CREATE VIEW TO scott;

SELECT *
FROM tab;

SELECT *
FROM dba_users
WHERE username = 'SCOTT';

SELECT username, COUNT(*) FROM v$session GROUP BY username;
