set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: UsrObj | Shows the objects from a any schema.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  03/10/2009 | Creation
--         23/11/2014 | New indentation standard and OBJECT_ID added
-- Params: owner object_type
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt UsrObj | Shows the objects from a any schema.
prompt ------------------------------------------------------------------------------|
prompt Use:     usrobj owner|% object_type|%
prompt Example: usrobj am_olvera tabl%
prompt ------------------------------------------------------------------------------|

  select owner,
         object_id,
         object_name,
         object_type,
         created,
         last_ddl_time,
         status
    from dba_objects
   where owner       like upper ('&1')
     and object_type like upper ('&2')
order by owner,
         object_type,
         object_name;

undefine 1 2
set verify on

