--------------------------------------------------------------------------------------------------------------
-- Script: Date | Shows the date of the database server.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  21/11/2009 | Creation
--         17/11/2014 | New indentation standard
-- Params: none
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Date | Shows the date of the database server.
prompt ------------------------------------------------------------------------------|
prompt Use:     date
prompt Example: date
prompt ------------------------------------------------------------------------------|

select to_char (sysdate, 'dd/mm/yyyy hh24:mi:ss') db_date
  from dual;

