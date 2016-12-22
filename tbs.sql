set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Tbs | Shows the tablespaces and their sizes.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  21/09/2009 | Creation
--         25/11/2009 | Tablespace TEMP added
--         03/06/2011 | Tablespace filter added
--         01/06/2013 Some adjustments
--         17/11/2014 | New indentation standard
-- Params: tablespace_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Tbs | Shows the tablespaces and their sizes.
prompt ------------------------------------------------------------------------------|
prompt Use:     tbs tablespace_name|%
prompt Example: tbs system
prompt _        If suggest_mb > 0, add that quantity of MB to keep at least at 85%.
prompt ------------------------------------------------------------------------------|

  select tbs.tablespace_name,
         tbs.block_size,
         tbs.logging,
         tbs.encrypted cry,
         tbs.status,
         fil.total_mb,
         fil.free_mb,
         fil.total_mb - fil.free_mb                                 used_mb,
         ((fil.total_mb - fil.free_mb) / fil.total_mb) * 100        used_pct,
         (((fil.total_mb - fil.free_mb) * 100) / 85) - fil.total_mb suggest_mb
    from (select distinct tablespace_name                       tbs,
                 (select sum (bytes) / 1024 / 1024
                    from dba_data_files
                   where tablespace_name = ddf.tablespace_name) total_mb,
                 (select sum (bytes) / 1024 / 1024
                    from dba_free_space
                   where tablespace_name = ddf.tablespace_name) free_mb
            from dba_data_files ddf
          union all
          select distinct tablespace_name                       tbs,
                 (select sum (bytes) / 1024 / 1024
                    from dba_temp_files
                   where tablespace_name = dtf.tablespace_name) total_mb,
                 (select sum (bytes_free) / 1024 / 1024
                    from gv$temp_space_header
                   where tablespace_name = dtf.tablespace_name) free_mb
            from dba_temp_files dtf) fil,
         dba_tablespaces             tbs
   where tbs.tablespace_name = fil.tbs
     and fil.tbs like upper ('&1')
order by used_pct desc;

undefine 1
set verify on

