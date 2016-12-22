set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: ColDef | Shows information of a column.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  31/05/2011 | Creation
--         01/06/2013 | Some adjustments
--         01/12/2013 | Indexed column added
-- Params: column_name  column_name|%
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt ColDef | Shows info of a column.
prompt ------------------------------------------------------------------------------|
prompt Use:     coldef column_name|%
prompt Example: coldef application_id
prompt ------------------------------------------------------------------------------|

select col.owner,
       col.table_name,
       col.data_type,
       col.data_length,
       col.data_precision,
       col.data_scale,
       col.nullable,
       col.num_nulls,
       decode ((select count (*)
                from   dba_ind_columns
                where  column_name = col.column_name
                  and  table_name  = col.table_name
                  and  table_owner = col.owner), 0, 'N',
                                                    'Y') indexed
from   dba_tab_columns col
where  col.column_name like upper ('&1')
order by col.owner,
         col.table_name;

undefine 1
set verify on

