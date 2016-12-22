set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Qry | Shows queries from the shared pool.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  22/09/2009 | Creation
--         17/11/2009 | System's users filter added
--         07/06/2012 | Owner's objects and executed queries "by" filter added
--         17/11/2014 | New indentation standard
-- Params: owner user min_buffer_gets min_executions fs_file_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Qry | Shows queries from the shared pool.
prompt _             owner = queries accessing the objects of this owner
prompt _             user  = queries executed by this user
prompt ------------------------------------------------------------------------------|
prompt Use:     qry owner|% user|% min_buffer_gets min_executions fs_file_name
prompt Example: qry am_olvera o_olguin 50000 1 /home/oracle/queries.txt
prompt ------------------------------------------------------------------------------|

spool &5

  select hash_value,
         execs,
         avg_gets,
         avg_reads,
         avg_time,
         cost,
         last_exec_by,
         qry
    from (select hash_value,
                 executions                          execs,
                 round (buffer_gets / executions)    avg_gets,
                 round (disk_reads / executions)     avg_reads,
                 elapsed_time / 1000000 / executions avg_time,
                 optimizer_cost                      cost,
                 substr (parsing_schema_name, 1, 20) last_exec_by,
                 substr (replace (replace (sql_text, chr (10), ''), '  ', ' '), 1, 40) qry
            from v$sqlarea
           where buffer_gets             >= &3
             and executions              >= &4
             and parsing_schema_name   like upper ('&2')
             and parsing_schema_name not in ('BI',  'ODM',   'QS_CS',  'DBSNMP', 'TSMSYS',   'QS_CBADM',    'FLOWS_010500', 'AURORA$ORB$UNAUTHENTICATED',
                                             'HR',  'SYS',   'QS_ES',  'EXFSYS', 'LBACSYS',  'REPADMIN',    'FLOWS_010600',      'SPATIAL_WFS_ADMIN_USR',
                                             'IX',  'XDB',   'QS_OS',  'MDDATA', 'ODM_MTR',  'TRACESVR',    'FLOWS_020000',      'SPATIAL_CSW_ADMIN_USR',
                                             'OE',  'DMSYS', 'QS_WS',  'ORDSYS', 'OLAPSYS',  'ANONYMOUS',   'FLOWS_020200',        'AURORA$JIS$UTILITY$',
                                             'PM',  'DSSYS', 'SCOTT',  'OWBSYS', 'WK_TEST',  'MGMT_VIEW',   'FLOWS_030000',
                                             'QS',  'MDSYS', 'WKSYS',  'QS_ADM', 'WKPROXY',  'ORACLE_OCM',  'OSE$HTTP$ADMIN',
                                             'SH',  'OUTLN', 'WMSYS',  'SYSMAN', 'XS$NULL',  'ORDPLUGINS',  'APEX_PUBLIC_USER',
                                             'DIP', 'QS_CB', 'CTXSYS', 'SYSTEM', 'PERFSTAT', 'FLOWS_FILES', 'SI_INFORMTN_SCHEMA')
             and hash_value              in (select hash_value
                                               from v$sql_plan
                                              where object_owner like upper ('&1')))
order by avg_time desc;

spool off
undefine 1 2 3 4 5
set verify on

