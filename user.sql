set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: User | Shows information of users.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  01/10/2009 | Creation
--         01/06/2013 | Some adjustments
-- Params: user_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt User | Shows information of users.
prompt ------------------------------------------------------------------------------|
prompt Use:     user user_name|%
prompt Example: user am_olvera
prompt ------------------------------------------------------------------------------|

select usr.username,
      (select password
       from   user$
       where  name = usr.username)  password,
      (select count (*)
       from   dba_objects
       where  owner = usr.username) obj_qty,
      (select sum (bytes) / 1024 / 1024
       from   dba_segments
       where  owner = usr.username) total_mb,
       usr.account_status,
       usr.created,
       usr.default_tablespace,
       usr.temporary_tablespace
from   dba_users usr
where  usr.username like upper ('&1')
order by usr.username;

undefine 1
set verify on

