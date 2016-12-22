set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: QryCur | Shows the quantity of queries running.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  06/10/2012 | Creation
--         17/11/2014 | New indentation standard and instance information
--         23/11/2014 | Query detail added
-- Params: min_qty
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt QryCur | Shows the quantity of queries running.
prompt ------------------------------------------------------------------------------|
prompt Use:     qrycur inst_id|% min_qty
prompt Example: qrycur 1 10
prompt ------------------------------------------------------------------------------|

  select ses.sql_hash_value,
         count (*) qty,
         substr (replace (replace (replace (sql.sql_text, chr (10), ''), '  ', ' '), '  ', ' '), 1, 40) qry
    from gv$session ses,
         gv$sqlarea sql
   where ses.sql_hash_value    = sql.hash_value
     and ses.inst_id           = sql.inst_id
     and ses.status            = 'ACTIVE'
     and ses.inst_id        like '&1'
group by ses.sql_hash_value,
         substr (replace (replace (replace (sql.sql_text, chr (10), ''), '  ', ' '), '  ', ' '), 1, 40)
  having count (*) >= &2
order by qty desc;

undefine 1
set verify on

