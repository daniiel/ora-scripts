set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: DicCol | Shows tables and/or columns from the dictionary.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  22/06/2010 | Creation
--         01/06/2013 | Different adjustments
--         17/11/2014 | New indentation standard
-- Params: table_name column_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt DicCol | Shows tables and/or columns from the dictionary.
prompt ------------------------------------------------------------------------------|
prompt Use:     dictcol table_name|% column_name|%
prompt Example: dictcol dba_tab% table_name
prompt ------------------------------------------------------------------------------|

  select table_name,
         column_name,
         comments comm_col
    from dict_columns
   where table_name  like upper ('&1')
     and column_name like upper ('&2')
order by table_name;

undefine 1 2
set verify on

