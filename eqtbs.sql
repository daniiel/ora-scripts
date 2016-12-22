set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: EqTbs | Shows tables and indexes sharing the same tablespace.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  19/09/2011 | Creation
--         05/06/2012 | Oracle users added to avoid them
--         17/11/2014 | New indentation standard
-- Params: owner table_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt EqTbs | Shows tables and indexes sharing the same tablespace.
prompt ------------------------------------------------------------------------------|
prompt Use:     eqtbs owner|% table_name|%
prompt Example: eqtbs am_olvera emp%
prompt ------------------------------------------------------------------------------|

  select tab.owner,
         tab.table_name,
         idx.index_name,
         idx.status,
         tab.tablespace_name
    from dba_tables  tab,
         dba_indexes idx
   where tab.table_name      = idx.table_name
     and tab.tablespace_name = idx.tablespace_name
     and tab.owner        like upper ('&1')
     and tab.table_name   like upper ('&2')
     and tab.owner      not in ('BI',  'ODM',   'QS_CS',  'DBSNMP', 'TSMSYS',   'QS_CBADM',    'FLOWS_010500', 'AURORA$ORB$UNAUTHENTICATED',
                                'HR',  'SYS',   'QS_ES',  'EXFSYS', 'LBACSYS',  'REPADMIN',    'FLOWS_010600',      'SPATIAL_WFS_ADMIN_USR',
                                'IX',  'XDB',   'QS_OS',  'MDDATA', 'ODM_MTR',  'TRACESVR',    'FLOWS_020000',      'SPATIAL_CSW_ADMIN_USR',
                                'OE',  'DMSYS', 'QS_WS',  'ORDSYS', 'OLAPSYS',  'ANONYMOUS',   'FLOWS_020200',        'AURORA$JIS$UTILITY$',
                                'PM',  'DSSYS', 'SCOTT',  'OWBSYS', 'WK_TEST',  'MGMT_VIEW',   'FLOWS_030000',
                                'QS',  'MDSYS', 'WKSYS',  'QS_ADM', 'WKPROXY',  'ORACLE_OCM',  'OSE$HTTP$ADMIN',
                                'SH',  'OUTLN', 'WMSYS',  'SYSMAN', 'XS$NULL',  'ORDPLUGINS',  'APEX_PUBLIC_USER',
                                'DIP', 'QS_CB', 'CTXSYS', 'SYSTEM', 'PERFSTAT', 'FLOWS_FILES', 'SI_INFORMTN_SCHEMA')
order by tab.owner,
         tab.table_name,
         idx.index_name;

undefine 1 2
set verify on

