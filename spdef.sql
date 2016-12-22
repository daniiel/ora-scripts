set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: SpDef | Shows and extract to a file a stored program.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  29/09/2009 | Creation
--         17/11/2014 | New indentation standard and changes of order in parameters
-- Params: program_name fs_file_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt SpDef | Shows and extract to a file a stored program.
prompt ------------------------------------------------------------------------------|
prompt Use:     spdef program_name fs_file_name
prompt Example: spdef fill_tab /home/oracle/fill_tab.txt
prompt ------------------------------------------------------------------------------|

set feedback off
set heading  off
spool &2

select text
  from dba_source
 where name = upper ('&1');

spool off

undefine 1 2
set verify   on
set feedback on
set heading  on

