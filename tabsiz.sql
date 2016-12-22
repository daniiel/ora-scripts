set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: TabSiz | Shows the size of a table [with its indexes].
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  17/09/2013 | Creation.
-- Params: owner table_name with_idx
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt TabSiz | Shows the size of a table [with its indexes].
prompt ------------------------------------------------------------------------------|
prompt Use:     tabsiz owner|% table_name|% with_idx(y|n)
prompt Example: tabsiz am_olvera employ% y
prompt ------------------------------------------------------------------------------|

  select owner,
         table_name,
         decode (upper ('&3'), 'Y', (select sum (nvl (bytes, 0)) / 1024 / 1024
                                       from dba_segments
                                      where segment_name  = tab.table_name
                                         or segment_name in (select index_name 
                                                               from dba_indexes
                                                              where table_name = tab.table_name)),
                                    (select sum (nvl (bytes, 0)) / 1024 / 1024
                                       from dba_segments
                                      where segment_name = tab.table_name)) total_mb
    from dba_tables tab
   where owner      not in ('BI',  'ODM',   'QS_CS',  'DBSNMP', 'TSMSYS',   'QS_CBADM',    'FLOWS_010500', 'AURORA$ORB$UNAUTHENTICATED',
                            'HR',  'SYS',   'QS_ES',  'EXFSYS', 'LBACSYS',  'REPADMIN',    'FLOWS_010600',      'SPATIAL_WFS_ADMIN_USR',
                            'IX',  'XDB',   'QS_OS',  'MDDATA', 'ODM_MTR',  'TRACESVR',    'FLOWS_020000',      'SPATIAL_CSW_ADMIN_USR',
                            'OE',  'DMSYS', 'QS_WS',  'ORDSYS', 'OLAPSYS',  'ANONYMOUS',   'FLOWS_020200',        'AURORA$JIS$UTILITY$',
                            'PM',  'DSSYS', 'SCOTT',  'OWBSYS', 'WK_TEST',  'MGMT_VIEW',   'FLOWS_030000',
                            'QS',  'MDSYS', 'WKSYS',  'QS_ADM', 'WKPROXY',  'ORACLE_OCM',  'OSE$HTTP$ADMIN',
                            'SH',  'OUTLN', 'WMSYS',  'SYSMAN', 'XS$NULL',  'ORDPLUGINS',  'APEX_PUBLIC_USER',
                            'DIP', 'QS_CB', 'CTXSYS', 'SYSTEM', 'PERFSTAT', 'FLOWS_FILES', 'SI_INFORMTN_SCHEMA')
     and owner        like upper ('&1')
     and table_name   like upper ('&2')
order by owner, table_name;

undefine 1 2 3
set verify on

