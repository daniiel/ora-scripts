set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: ParPer | Shows performance relative parameters.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  06/10/2012 | Creation
--         20/11/2014 | New indentation standard and adaptation for GV$
-- Params: instance_id parameter_type
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt ParPer | Shows performance relative parameters.
prompt ------------------------------------------------------------------------------|
prompt Use:     parper inst_id parameter_type (MEM|AUDIT|DIR|MISC|PERF|NLS|PX|UNDO|%)
prompt Example: parper 1 mem
prompt ------------------------------------------------------------------------------|

  select *
    from (select 'MEM' par_type,
                 inst_id,
                 name,
                 value
          from   gv$parameter
          where  name in ('db_cache_size',
                          'shared_pool_size',
                          'pga_aggregate_target',
                          'db_cache_size',
                          'memory_max_target',
                          'memory_target',
                          'sga_max_size',
                          'sort_area_size')
          union
          select 'AUDIT' par_type,
                 inst_id,
                 name,
                 value
            from gv$parameter
           where name in ('audit_file_dest',
                          'audit_sys_operations',
                          'audit_trail')
          union
          select 'DIR' par_type,
                 inst_id,
                 name,
                 value
            from gv$parameter
           where name in ('background_dump_dest',
                          'core_dump_dest',
                          'db_recovery_file_dest',
                          'log_archive_dest',
                          'log_archive_dest_1',
                          'log_archive_dest_2',
                          'log_archive_dest_3',
                          'user_dump_dest',
                          'utl_file_dir')
          union
          select 'MISC' par_type,
                 inst_id,
                 name,
                 value
            from gv$parameter
           where name in ('asm_diskgroups',
                          'instance_number',
                          'compatible',
                          'control_files',
                          'db_files',
                          'db_flash_cache_size',
                          'db_flashback_retention_target',
                          'open_cursors',
                          'processes',
                          'recyclebin',
                          'resource_limit',
                          'sessions',
                          'spfile')
          union
          select 'PERF' par_type,
                 inst_id,
                 name,
                 value
            from gv$parameter
           where name in ('cursor_sharing',
                          'db_block_size',
                          'optimizer_mode',
                          'sql_trace')
          union
          select 'NLS' par_type,
                 inst_id,
                 name,
                 value
            from gv$parameter
           where name in ('nls_date_format',
                          'nls_language',
                          'nls_territory')
          union
          select 'PX' par_type,
                 inst_id,
                 name,
                 value
            from gv$parameter
           where name in ('parallel_degree_limit',
                          'parallel_max_servers',
                          'parallel_min_servers',
                          'parallel_servers_target',
                          'parallel_server')
          union
          select 'UNDO' par_type,
                 inst_id,
                 name,
                 value
            from gv$parameter
           where name in ('undo_management',
                          'undo_retention'))
   where inst_id like '&1'
     and par_type like upper ('&2')
order by par_type,
         name,
         inst_id;

undefine 1 2
set verify on

