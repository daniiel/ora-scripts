set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: ObjDef | Shows details of an object.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  23/09/2009 | Creation
--         17/11/2014 | New indentation standard
-- Params: object_name  object_name|%
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt ObjDef | Shows details of an object.
prompt ------------------------------------------------------------------------------|
prompt Use:     objdef object_name|%
prompt Example: objdef dept%
prompt ------------------------------------------------------------------------------|

  select owner,
         object_id,
         object_name,
         object_type,
         created,
         last_ddl_time,
         status
    from dba_objects
   where object_name like upper ('&1')
order by owner,
         object_type,
         object_name;

undefine 1
set verify on

