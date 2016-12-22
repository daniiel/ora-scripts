set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: UsrSiz | Shows the size of different object types from a schema.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  17/09/2013 | Creation.
-- Params: owner object_type
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt UsrSiz | Shows the size of different object types from a schema.
prompt ------------------------------------------------------------------------------|
prompt Use:     usrsiz owner|% object_type|%
prompt Example: usrsiz am_olvera tab%
prompt ------------------------------------------------------------------------------|

select owner,
       decode (segment_type, 'TABLE PARTITION',    'TABLE',
                             'TABLE SUBPARTITION', 'TABLE',
                             'INDEX PARTITION',    'INDEX',
                             'LOB PARTITION',      'LOBSEGMENT',
                             segment_type) segment_type,
       count (*) qty,
       sum (bytes) / 1024 / 1024 total_mb
from   dba_segments
where  owner        like upper ('&1')
  and  segment_type like upper ('&2')
group by owner,
         decode (segment_type, 'TABLE PARTITION',    'TABLE',
                               'TABLE SUBPARTITION', 'TABLE',
                               'INDEX PARTITION',    'INDEX',
                               'LOB PARTITION',      'LOBSEGMENT',
                               segment_type)
order by owner,
         segment_type;

undefine 1 2
set verify on

