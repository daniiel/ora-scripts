set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Dict | Shows the objects from the dictionary.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  22/02/2010 | Creation
--         17/11/2014 | New indentation standard
-- Params: table_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Dict | Shows the objects from the dictionary.
prompt ------------------------------------------------------------------------------|
prompt Use:     dict table_name
prompt Example: dict dba_tables|%
prompt ------------------------------------------------------------------------------|

  select table_name,
         comments
    from dictionary
   where table_name like upper ('&1')
order by table_name;

undefine 1
set verify on

