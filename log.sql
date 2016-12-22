set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Log | Show information of the redo log files.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  12/11/2013 | Creation
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Log | Show information of the redo log files.
prompt ------------------------------------------------------------------------------|
prompt Use:     log instance_id|%
prompt Example: log 1
prompt ------------------------------------------------------------------------------|

select log.inst_id,
       log.group#,
       log.thread#,
       log.sequence#,
       fil.type,
       log.status,
       log.archived,
       log.bytes / 1024 / 1024 total_mb,
       log.blocksize,
       fil.member
from   gv$log     log,
       gv$logfile fil
where  log.inst_id    = fil.inst_id
  and  log.group#     = fil.group#
  and  log.inst_id like '&1'
order by log.inst_id, log.group#, log.thread#, log.sequence#;

undefine 1
set verify on

