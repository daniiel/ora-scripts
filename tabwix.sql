set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: tabwidx | Shows unindexed tables in a schema.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  03/10/2012 | Creation
--         01/06/2013 | Some adjustments
-- Params: owner
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt TabWIdx | Shows unindexed tables in a schema.
prompt ------------------------------------------------------------------------------|
prompt Use:     tabwidx owner|%
prompt Example: tabwidx am_olvera
prompt ------------------------------------------------------------------------------|

select owner,
       tablespace_name,
       table_name
from   dba_tables
where  owner        like upper ('&1')
  and  table_name not in (select distinct table_name
                          from   dba_indexes
                          where  table_owner like upper ('&1'))
order by owner,
         tablespace_name,
         table_name;

undefine 1
set verify on

