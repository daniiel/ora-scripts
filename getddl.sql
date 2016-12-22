set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: GetDdl | Shows the DDL of an object.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  12/11/2009 | Creation
--         23/02/2010 | Decode added when a tablespace
--         17/11/2014 | New indentation standard
-- Params: owner object_name object_type
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt GetDdl | Shows the DDL of an object.
prompt ------------------------------------------------------------------------------|
prompt Use:     getddl owner object_name object_type
prompt Example: getddl am_olvera employees table
prompt _        owner is null when a tablespace
prompt ------------------------------------------------------------------------------|

select dbms_metadata.get_ddl (schema      => decode (upper ('&1'), 'NULL', null,
                                                                   upper ('&1')),
                              name        => upper ('&2'),
                              object_type => upper ('&3')) object_ddl
  from dual;

undefine 1 2 3
set verify on

