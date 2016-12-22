set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: VwDef | Shows a view definition.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  29/09/2009 | Creation
--         16/11/2014 | New indentation standard
-- Params: owner view_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt VwDef | Shows a view definition.
prompt ------------------------------------------------------------------------------|
prompt Use:     vwdef owner|% view_name|%
prompt Example: vwdef am_olvera emp%
prompt ------------------------------------------------------------------------------|
          
  select owner,
         view_name,
         text text_view
    from dba_views
   where owner     like upper ('&1')
     and view_name like upper ('&2')
order by owner, view_name;

undefine 1 2
set verify on

