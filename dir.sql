set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Dir | Shows directories created in the database.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  21/06/2010 | Creation
--         17/11/2014 | New indentation standard
-- Params: directory_name owner
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Dir | Shows directories created in the database.
prompt ------------------------------------------------------------------------------|
prompt Use:     dir owner|% directory_name|%
prompt Example: dir am_olvera emp_dir%
prompt ------------------------------------------------------------------------------|

  select owner,
         directory_name,
         directory_path
    from dba_directories
   where owner          like upper ('&2')
     and directory_name like upper ('&1')
order by owner,
         directory_name;

undefine 1 2
set verify on

