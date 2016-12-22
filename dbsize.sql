--------------------------------------------------------------------------------------------------------------
-- Script: DBSize | Shows size of the database.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  04/10/2009 | Creation
--         17/11/2009 | Prompt added
--         25/11/2009 | MB and GB totals added
--         17/11/2014 | New indentation standard
-- Params: none
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt DBSize | Shows size of the database.
prompt ------------------------------------------------------------------------------|
prompt Use:     dbsize
prompt Example: dbsize
prompt ------------------------------------------------------------------------------|

select 'USED'                           size_type,
       sum (bytes) / 1024 / 1024        total_mb,
       sum (bytes) / 1024 / 1024 / 1024 total_gb
  from dba_segments
union all
select 'RESERVED'                       size_type,
       sum (bytes) / 1024 / 1024        total_mb,
       sum (bytes) / 1024 / 1024 / 1024 total_gb
  from (select bytes
          from dba_data_files
        union all
        select bytes
          from dba_temp_files);

