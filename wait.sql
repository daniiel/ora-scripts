--------------------------------------------------------------------------------------------------------------
-- Script: Wait | Shows the waits of the database server.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  04/10/2009 | Creation
--         07/06/2012 | Wait's average added
--         16/11/2014 | New indentation standard
-- Params: none
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Wait | Shows the waits of the database server.
prompt ------------------------------------------------------------------------------|
prompt Use:     wait
prompt Example: wait
prompt ------------------------------------------------------------------------------|

  select event,
         state,
         count (*)                       qty,
         avg (wait_time_micro / 1000000) avg_time
    from v$session_wait
group by event,
         state
order by qty desc;

