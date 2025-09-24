select username
from all_users;

alter session set "_ORACLE_SCRIPT"=true;

create user scott
identified by tiger
default tablespace users
temporary tablespace temp;

GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE
TO scott;