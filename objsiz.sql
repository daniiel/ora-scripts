set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: ObjSiz | Shows the size of objects from a schema.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  19/09/2011 | Creation.
--         17/08/2013 | Adaptation.
--         17/11/2014 | New indentation standard
--         23/11/2014 | New sum of total_mb added by owner
-- Params: owner object_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt ObjSiz | Shows the size of objects from a schema.
prompt ------------------------------------------------------------------------------|
prompt Use:     objsiz owner|% object_name|%
prompt Example: objsiz am_olvera employ%
prompt ------------------------------------------------------------------------------|

break on owner
compute sum of total_mb on owner

  select owner,
         segment_name,
         segment_type,
         sum (bytes) / 1024 / 1024 total_mb
    from dba_segments
   where owner        like upper ('&1')
     and segment_name like upper ('&2')
group by owner,
         segment_name,
         segment_type
order by owner,
         segment_name;

clear breaks
clear computes
undefine 1 2
set verify on

