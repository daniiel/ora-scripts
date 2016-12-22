set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: TabDef | Shows general information of a table.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  05/12/2009 | Creation
--         17/11/2014 | New indentation standard and adjustments
-- Params: owner table_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt TabDef | Shows general information of a table.
prompt ------------------------------------------------------------------------------|
prompt Use:     tabdef owner|% table_name|%
prompt Example: tabdef am_olvera employ%
prompt ------------------------------------------------------------------------------|

  select owner,
         table_name,
         tablespace_name,
         ' ' partition_name,
         logging,
         num_rows,
         avg_row_len,
         last_analyzed
    from dba_tables
   where owner      like upper ('&1')
     and table_name like upper ('&2')
union
  select table_owner owner,
         table_name,
         tablespace_name,
         partition_name,
         logging,
         num_rows,
         avg_row_len,
         last_analyzed
    from dba_tab_partitions
   where table_owner like upper ('&1')
     and table_name  like upper ('&2') 
order by owner,
         table_name,
         partition_name;

undefine 1 2
set verify on

