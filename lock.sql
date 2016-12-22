set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Lock | Shows the locked objects.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  04/10/2009 | Creation
--         29/06/2012 | Condition added for V$SESSION y V$LOCKED_OBJECTS
--         17/11/2014 | New indentation standard, GV$ modification and instance filter.
-- Params: inst_id
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Lock | Shows the locked objects.
prompt ------------------------------------------------------------------------------|
prompt Use:     lock inst_id|%
prompt Example: lock 1
prompt ------------------------------------------------------------------------------|

  select ses.sid || ',' || ses.serial# sidserial,
         lck.oracle_username,
         ses.osuser,
         obj.owner,
         obj.object_name,
         obj.object_type
    from dba_objects      obj,
         gv$locked_object lck,
         gv$session       ses
   where lck.object_id     = obj.object_id
     and lck.session_id    = ses.sid
     and lck.inst_id       = ses.inst_id
     and lck.inst_id    like '&1'
order by obj.owner,
         obj.object_name;

undefine 1
set verify on
