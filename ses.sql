set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Ses | Shows the sessions and its processes.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  03/10/2009 | Creation
--         04/12/2009 | Adding logon_time and remove osuser
--         03/0672011 | Parameters adjustment
--         17/11/2014 | New indentation standard
-- Params: username sid user_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Ses | Shows the sessions and its processes.
prompt ------------------------------------------------------------------------------|
prompt Use:     ses inst_id|% sid|% user_name|%
prompt Example: ses % 7721 am_olvera
prompt ------------------------------------------------------------------------------|

  select pro.inst_id,
         pro.pid,
         pro.spid,
         ses.sid,
         ses.serial#,
         ses.username,
         ses.machine,
         ses.sql_hash_value,
         to_char (ses.logon_time, 'dd/mm/yyyy hh24:mi:ss') logon_time
    from gv$session ses,
         gv$process pro
   where ses.paddr      = pro.addr
     and pro.inst_id  like '&1'
     and ses.sid      like '&2'
     and ses.username like upper ('&3')
order by pro.inst_id,
         ses.username;

undefine 1 2 3
set verify on

