set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Reg | Shows the registry values of the Oracle components.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  14/11/2011 | Creation
--         17/11/2014 | New indentation standard
-- Params: comp_id comp_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Reg | Shows the registry values of the Oracle components.
prompt ------------------------------------------------------------------------------|
prompt Use:     reg comp_id|% comp_name|%
prompt Example: reg catalog %atalog%
prompt ------------------------------------------------------------------------------|

  select comp_id,
         comp_name,
         version,
         status
    from dba_registry
   where comp_id   like upper ('&1')
     and comp_name like '&2'
order by comp_name;

undefine 1 2
set verify on

