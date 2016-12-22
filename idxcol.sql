set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: IdxCol | Shows the indexes where a column is included.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  17/11/2009 | Creation
--         01/12/2013 | Changes in columns and filters
-- Params: table_name column_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt IdxCol | Shows the indexes where a column is included.
prompt ------------------------------------------------------------------------------|
prompt Use:     idxcol table_name|% column_name|%
prompt Example: idxcol emp empno
prompt ------------------------------------------------------------------------------|

  select ind.owner,
         ind.index_name,
         ind.tablespace_name tbs,
         ind.table_name,
         ind.status,
         col.descend
    from dba_indexes     ind,
         dba_ind_columns col
   where ind.index_name     = col.index_name
     and ind.owner          = col.index_owner
     and ind.table_name  like upper ('&1')
     and col.column_name like upper ('&2')
order by ind.owner,
         ind.table_name,
         ind.index_name;

undefine 1 2
set verify on

