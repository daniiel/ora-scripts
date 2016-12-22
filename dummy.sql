set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Dummy | Fills a table with dummy records.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  23/06/2010 | Creation
--         21/11/2013 | Some adjustments for n rows and new information
--         24/11/2013 | Cloning removal, now just fills a table with records
--         17/11/2014 | Additional adjustments to run for n rows and new indentation standard
-- Params: owner table_name record_qty commit_interval
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Dummy | Fills a table with dummy records.
prompt Use:     dummy owner|null table_name record_qty commit_interval
prompt Example: dummy am_olvera emp 1000 100
prompt ------------------------------------------------------------------------------|

declare
  ls_owner      all_tab_columns.owner%type      := upper ('&1');     /* Table's owner.                                   */
  ls_table_name all_tab_columns.table_name%type := upper ('&2');     /* Table name to fill.                              */
  ln_record_qty number (10)                     := to_number ('&3'); /* Records' quantity to fill.                       */
  ln_commit_cnt number (10)                     := to_number ('&4'); /* Commit interval, how many records before commit? */
  ln_row_cnt    number (10)                     := 1;                /* Row counter for the commit process.              */
  ls_query      clob;                                                /* Insert query to run for the filling process.     */
begin
  /* Validation of the OWNER and insert statement building. */
  if ls_owner = 'NULL' then
    ls_query := 'insert into ' || ls_table_name || ' values (';
  else
    ls_query := 'insert into ' || ls_owner || '.' || ls_table_name || ' values (';
  end if;

  /* Insert statement building... */
  /* If owner is NULL, then use USER_TAB_COLUMNS, if not, DBA_TAB_COLUMNS. */
  if ls_owner = 'NULL' then
    for c in (select data_type,
                     data_length,
                     nvl (data_precision, 0) data_precision,
                     nvl (data_scale, 0)     data_scale
              from   user_tab_columns
              where  table_name = ls_table_name
              order by column_id) loop

      /* Character columns. */
      if c.data_type in ('CHAR', 'VARCHAR2', 'VARCHAR') then
        ls_query := ls_query || 'dbms_random.string (''a'',' || c.data_length || '),';
      elsif c.data_type in ('CLOB', 'LONG') then
        ls_query := ls_query || 'dbms_random.string (''a'',1000),';

      /* Number columns.    */
      elsif c.data_type = 'NUMBER' and c.data_precision > 0 then
        ls_query := ls_query || 'dbms_random.value (1, ' || rpad ('9', c.data_precision - c.data_scale, '9') || '),';
      elsif c.data_type in ('NUMBER', 'FLOAT') then
        ls_query := ls_query || 'dbms_random.value (1, 1000000),';

      /* Date columns.      */
      elsif c.data_type = 'DATE' then
        ls_query := ls_query || 'sysdate+dbms_random.value+dbms_random.value (1,1000),';
      elsif substr (c.data_type, 1, 9) = 'TIMESTAMP' then
        ls_query := ls_query || 'sysdate+dbms_random.value+dbms_random.value (1,1000),';

      /* Special columns. */
      elsif c.data_type = 'RAW' then
        ls_query := ls_query || 'sys_guid (),';
      elsif c.data_type = 'BLOB' then
        ls_query := ls_query || 'utl_raw.cast_to_raw (''test data''),';
      end if;
    end loop;
  else
    for c in (select data_type,
                     data_length,
                     nvl (data_precision, 0) data_precision,
                     nvl (data_scale, 0)     data_scale
              from   dba_tab_columns
              where  table_name = ls_table_name
                and  owner      = ls_owner
              order by column_id) loop

      /* Character columns. */
      if c.data_type in ('CHAR', 'VARCHAR2', 'VARCHAR') then
        ls_query := ls_query || 'dbms_random.string (''a'',' || c.data_length || '),';
      elsif c.data_type in ('CLOB', 'LONG') then
        ls_query := ls_query || 'dbms_random.string (''a'',1000),';

      /* Number columns.    */
      elsif c.data_type = 'NUMBER' and c.data_precision > 0 then
        ls_query := ls_query || 'dbms_random.value (1, ' || rpad ('9', c.data_precision - c.data_scale, '9') || '),';
      elsif c.data_type in ('NUMBER', 'FLOAT') then
        ls_query := ls_query || 'dbms_random.value (1, 1000000),';

      /* Date columns.      */
      elsif c.data_type = 'DATE' then
        ls_query := ls_query || 'sysdate+dbms_random.value+dbms_random.value (1,1000),';
      elsif substr (c.data_type, 1, 9) = 'TIMESTAMP' then
        ls_query := ls_query || 'sysdate+dbms_random.value+dbms_random.value (1,1000),';

      /* Special columns. */
      elsif c.data_type = 'RAW' then
        ls_query := ls_query || 'sys_guid (),';
      elsif c.data_type = 'BLOB' then
        ls_query := ls_query || 'utl_raw.cast_to_raw (''test data''),';
      end if;
    end loop;
  end if;

  /* Adjusting the query before execution. */
  ls_query := rtrim (ls_query, ',') || ')';
  
  /* Execute the query ln_record_qty times to insert the same number of records. */
  for i in 1..ln_record_qty loop
    execute immediate ls_query;
    ln_row_cnt := ln_row_cnt + 1;

    if ln_row_cnt = ln_commit_cnt then
      commit;
      ln_row_cnt := 0;
    end if;
  end loop;
  commit;

exception
  when others then
    dbms_output.put_line ('Error in dummy execution: ' || sqlerrm);
end;
/

undefine 1 2 3 4
set verify on

