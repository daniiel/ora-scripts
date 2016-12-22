set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: ObjTyS | Shows the size of objects from a schema by OBJECT_TYPE.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  17/09/2013 | Creation.
--         17/11/2014 | New indentation standard, new total of GB and adjustments
--         23/11/2014 | New script name, changed from UsrSiz
-- Params: owner object_type
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt ObjTyS | Shows the size of objects from a schema by OBJECT_TYPE.
prompt ------------------------------------------------------------------------------|
prompt Use:     objtys owner|% object_type|%
prompt Example: objtys am_olvera tab%
prompt ------------------------------------------------------------------------------|

  select owner,
         decode (segment_type, 'TABLE PARTITION',    'TABLE',
                               'TABLE SUBPARTITION', 'TABLE',
                               'INDEX PARTITION',    'INDEX',
                               'LOB PARTITION',      'LOBSEGMENT',
                                                     segment_type) segment_type,
         count (*) qty,
         sum (bytes) / 1024 / 1024        total_mb,
         sum (bytes) / 1024 / 1024 / 1024 total_gb
    from dba_segments
   where owner        like upper ('&1')
     and segment_type like upper ('&2')
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

