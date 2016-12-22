set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: TbsDef | Shows the data files from one or more tablespaces.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  21/09/2009 | Creation
--         26/11/2009 | Name change
--         10/01/2013 | FILE_ID added for easy identification
--         01/06/2013 | Some adjustments
-- Params: tablespace_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt TbsDef | Shows the data files from one or more tablespaces.
prompt ------------------------------------------------------------------------------|
prompt Use:     tbsdef tablespace_name|%
prompt Example: tbsdef system
prompt ------------------------------------------------------------------------------|

select tablespace_name,
       file_id,
       file_name,
       total_mb,
       autoextensible,
       status,
       online_status
from  (select tablespace_name,
              file_id,
              file_name,
              bytes / 1024 / 1024 total_mb,
              autoextensible,
              status,
              online_status
       from   dba_data_files
       where  tablespace_name like upper ('&1')
       union all
       select tablespace_name,
              file_id,
              file_name,
              bytes / 1024 / 1024 total_mb,
              autoextensible,
              status,
              null online_status
       from   dba_temp_files
       where  tablespace_name like upper ('&1'))
order by tablespace_name,
         file_id;

undefine 1
set verify on

