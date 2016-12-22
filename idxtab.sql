set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: IdxTab | Shows the indexes and its columns for any table.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  21/09/2009 | Creation
--         24/11/2013 Some adjustments 
--         01/12/2013 | Changed the order of columns
--         17/11/2014 | New indentation standard
-- Params: table_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt IdxTab | Shows the indexes and its columns for any table.
prompt ------------------------------------------------------------------------------|
prompt Use:     idxtab table_name|%
prompt Example: idxtab emp
prompt ------------------------------------------------------------------------------|

  select ind.owner,
         ind.tablespace_name tbs,
         ind.index_name,
         ind.status,
         ind.table_owner,
         col.column_name,
         col.descend
    from dba_indexes     ind,
         dba_ind_columns col
   where ind.index_name = col.index_name
     and ind.owner      = col.index_owner
     and ind.table_name = upper ('&1')
order by ind.owner,
         ind.table_owner,
         ind.table_name,
         ind.index_name,
         col.column_position;

undefine 1
set verify on

