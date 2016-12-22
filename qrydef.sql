set verify   off
set feedback off
--------------------------------------------------------------------------------------------------------------
-- Script: QryDef | Query definition and its execution statistics.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  22/09/2009 | Creation
--         07/06/2012 | Adding statistics and format change
--         06/10/2012 | Header remove
--         17/11/2014 | New indentation standard
-- Params: hash_value
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt QryDef | Query definition and its execution statistics.
prompt ------------------------------------------------------------------------------|
prompt Use:     qrydef hash_value
prompt Example: qrydef 11072009
prompt ------------------------------------------------------------------------------|

select executions,
       round (buffer_gets / executions)    avg_gets,
       round (disk_reads / executions)     avg_reads,
       elapsed_time / 1000000 / executions avg_time,
       optimizer_cost                      cost,
       optimizer_mode                      opt,
       parsing_schema_name                 last_exec
  from v$sqlarea
 where hash_value = &1;

set heading off
ttitle off
prompt
          
  select replace (replace (replace (sql_text, chr (10), ' '), '  ', ' '), '  ', ' ') query
    from v$sqltext_with_newlines
   where hash_value = &1
order by piece;

prompt

undefine 1
set verify   on
set heading  on
set feedback on

