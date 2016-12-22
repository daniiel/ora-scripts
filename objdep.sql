set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: ObjDep | Shows the dependencies of an object.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  17/06/2010 | Creation
--         24/11/2013 | Parameters adjustment
--         17/11/2014 | New indentation standard
-- Params: owner object_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt ObjDep | Shows the dependencies of an object.
prompt ------------------------------------------------------------------------------|
prompt Use:     objdep owner|% object_name|%
prompt Example: objdep am_olvera employ%
prompt ------------------------------------------------------------------------------|

select owner,
       name,
       type,
       dependency_type
  from dba_dependencies
 where referenced_owner like upper ('&1')
   and referenced_name  like upper ('&2');

undefine 1 2
set verify on

