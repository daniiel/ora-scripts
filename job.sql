set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Job | Show infomation of jobs.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  27/11/2014 | Creation
-- Params: owner job_name
--------------------------------------------------------------------------------------------------------------

column start_date    format a19
column next_run_date format a19
column program_name  format a40

prompt ------------------------------------------------------------------------------|
prompt Job | Show infomation of jobs.
prompt ------------------------------------------------------------------------------|
prompt Use:     usrobj owner|% job_name|%
prompt Example: usrobj am_olvera dates%
prompt ------------------------------------------------------------------------------|

  select owner,
         job_name,
         state,
         program_name,
         to_char (start_date, 'dd/mm/yyyy hh24:mi:ss')    start_date,
         to_char (next_run_date, 'dd/mm/yyyy hh24:mi:ss') next_run_date,
         run_count,
         failure_count
    from dba_scheduler_jobs
   where owner    like upper ('&1')
     and job_name like upper ('&2')
order by owner,
         next_run_date;

undefine 1 2
set verify on

