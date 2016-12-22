set verify   off
set feedback off
--------------------------------------------------------------------------------------------------------------
-- Script: RowCnt | Shows rows quantities of the tables of owner.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  04/10/2009 | Creation
--         01/06/2010 | Modification for a nynamic table list
--         22/07/2011 | A cleaner output is implemented
--         24/11/2012 | Conversion to CLOB
-- Params: owner table_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt RowCnt | Shows rows quantities of the tables of owner.
prompt ------------------------------------------------------------------------------|
prompt Use:     rowcnt owner|% table_name|%
prompt Example: rowcnt am_olvera employees
prompt ------------------------------------------------------------------------------|

variable gx_refcursor refcursor; /* Ref cursor variable. */

declare 
  ls_query clob := '';           /* Variable for the compounded query. */
begin
  /* Query construction. */
  for c in (  select '  select ''' || table_name || ''' table_name, count (*) total ' ||
                     'from ' || owner || '.' || table_name || ' union ' next_query
                from dba_tables
               where owner      like upper ('&1')
                 and table_name like upper ('&2')
            order by table_name) loop

    ls_query := ls_query || c.next_query;

  end loop;

  ls_query := substr (ls_query, 1, length (ls_query) - 7);

  /* Query execution. */
  open :gx_refcursor for ls_query;
end;
/

undefine 1 2
set verify   on
set feedback on

