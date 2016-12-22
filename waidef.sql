set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: WaiDef | Shows the waits of a user.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  11/11/2013 | Creation
-- Params: sid username
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt WaiDef | Shows the waits of a user.
prompt ------------------------------------------------------------------------------|
prompt Use:     waidef sid|% username|%
prompt Example: waidef 1301 am_olvera
prompt ------------------------------------------------------------------------------|

select ses.sid,
       ses.username,
       wai.event,
       wai.state,
       wai.wait_time_micro / 1000000            curr_wait,
       wai.time_since_last_wait_micro / 1000000 last_wait
from   v$session_wait wai,
       v$session      ses
where  wai.sid         = ses.sid
  and  wai.sid      like '&1'
  and  ses.username like upper ('&2')
order by ses.username,
         wai.seconds_in_wait desc;

undefine 1 2
set verify on

