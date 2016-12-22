set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: InsDef | Shows information about instances.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  01/06/2013 | Creation
--         17/11/2014 | New indentation standard
-- Params: instance_number  instance_number|%
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt InsDef | Shows information about instances.
prompt ------------------------------------------------------------------------------|
prompt Use:     insdef instance_number|%
prompt Example: insdef 1
prompt ------------------------------------------------------------------------------|

  select inst_id,
         instance_name,
         host_name,
         version,
         startup_time startup,
         parallel,
         status
    from gv$instance
   where instance_number like '&1'
order by inst_id;

undefine 1
set verify on

