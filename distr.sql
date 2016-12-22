set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Distr | Shows the distribution of rows in a table.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  28/05/2010 | Creation
--         28/06/2010 | Adding HAVING to filter quantities
--         07/06/2012 | Adding total of rows
--         24/11/2013 | Some adjustments
--         17/11/2014 | New indentation standard
-- Params: [owner.]table_name column_name min_qty
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Distr | Shows the distribution of rows in a table.
prompt ------------------------------------------------------------------------------|
prompt Use:     distr [owner.]table_name column_name min_qty
prompt Example: distr am_olvera.employees first_name 1
prompt ------------------------------------------------------------------------------|

-- Definitions
def _def_total_reg    = ""
col c_total_reg noprint new_value _def_total_reg

break on c_total_reg
compute sum of qty on c_total_reg

  select 1 c_total_reg,
         &2,
         count (*) qty
    from &1
group by 1,
         &2
  having count (*) >= &3
order by &2;

clear breaks
clear computes
undefine 1 2 3
set verify on

