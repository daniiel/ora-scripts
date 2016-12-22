set heading  off
set feedback off
--------------------------------------------------------------------------------------------------------------
-- Script: XPlan | Shows the execution plan of a query after an explain plan.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  20/11/2009 | Creation
--         16/11/2014 | New indentation standard
-- Params: none
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt XPlan | Shows the execution plan of a query after an explain plan.
prompt ------------------------------------------------------------------------------|
prompt Use:     xplan
prompt Example: xplan
prompt ------------------------------------------------------------------------------|

select *
  from table (dbms_xplan.display);

set heading  on
set feedback on
