set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Param | Shows parameters of the database. 
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  06/10/2012 | Creation
--         20/11/2014 | New indentation standard and use of GV$
-- Params: instance_id parameter_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Param | Shows parameters of the database.
prompt ------------------------------------------------------------------------------|
prompt Use:     param instance_id parameter_name
prompt Example: param 1 %shared%
prompt ------------------------------------------------------------------------------|

  select inst_id,
         name,
         value
    from gv$parameter
   where inst_id like '&1'
     and name    like '&2'
order by name,
         inst_id;

undefine 1 2
set verify on

