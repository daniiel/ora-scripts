set echo     off
set feedback off
--------------------------------------------------------------------------------------------------------------
-- Script: ConUnx | Configures the SQL Plus console in Unix/Linux.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  17/09/2009 | Creation
--         22/09/2009 | Queries with database and instance info added
--         17/11/2009 | Quer instance-database configuration for RAC
--         20/11/2009 | Variables definition and instance info modification
--         25/11/2009 | New formats for totals
--         30/11/2009 | Database query modification
--         06/01/2010 | Tom Kyte's suggestions added like set serveroutput
--         17/06/2010 | Database info added
--         31/05/2011 | Time columns configuration
--         05/12/2011 | Registry info and concurrents columns configuration
--         07/06/2012 | SPID format change
--         29/06/2012 | SidSerial format added
--         06/10/2012 | Parameters columns configuration
--         01/06/2013 | Some adjustments
--         05/05/2014 | ASM columns added
-- Params: none
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt ConUnx | Configures the SQL Plus console in Unix/Linux.
prompt ------------------------------------------------------------------------------|
prompt Use:     conunx
prompt Example: conunx
prompt ------------------------------------------------------------------------------|

-- VI editor
define _editor=vi

-- Screen and SQL*Plus parameters
set autoprint    on
set lines        160
set long         99999999
set pages        30000
set serveroutput on size 1000000
set tab          off
set trimspool    on

-- Columns formatting
column account_status       format a16
column action_name          format a20
column appl                 format a8
column application_name     format a25
column avg_gets             format 99,999,990
column avg_reads            format 99,999,990
column avg_time             format 999,990.00
column column_name          format a30
column column_position      format 99
column comments             format a85
column comm_col             format a70 word_wrapped
column comp_name            format a50
column data_length          format 99,999
column data_type            format a30
column db_link              format a25
column db_link_2            format a10
column default_tablespace   format a25
column dependency_type      format a4 heading TYPE
column directory_path       format a80
column end_date             format a45 word_wrapped
column exec_id              format 9999999
column execs                format 9,999,990
column file_name            format a50
column flashback_on         format a5
column free_mb              format 99,999,990
column granted_role         format a25
column grantee              format a25
column grantor              format a20
column hash_value           format 99999999999
column high_value           format a80 word_wrapped
column host                 format a12
column host_name            format a25
column hr00                 format a4
column hr01                 format a4
column hr02                 format a4
column hr03                 format a4
column hr04                 format a4
column hr05                 format a4
column hr06                 format a4
column hr07                 format a4
column hr08                 format a4
column hr09                 format a4
column hr10                 format a4
column hr11                 format a4
column hr12                 format a4
column hr13                 format a4
column hr14                 format a4
column hr15                 format a4
column hr16                 format a4
column hr17                 format a4
column hr18                 format a4
column hr19                 format a4
column hr20                 format a4
column hr21                 format a4
column hr22                 format a4
column hr23                 format a4
column index_name           format a30
column inst_id              format 9999 heading INST
column interval             format a25
column job_action           format a120 word_wrapped
column job_action           format a45
column job_creator          format a20
column job_name             format a25
column last_exec_by         format a20
column limit                format a15
column log_user             format a6
column machine              format a25
column member               format a50
column mins                 format 99,999.9
column name                 format a30
column next_run_date        format a45 word_wrapped
column num_rows             format 999,999,990
column obj_name             format a30
column obj_qty              format 99,990
column object_name          format a30
column object_type          format a20
column os_username          format a30
column osuser               format a30
column owner                format a15
column partition_name       format a20
column partition_position   format 999 heading POS
column password             format a16 truncated
column pid                  format 99999
column plan_plus_exp        format a80
column used_pct             format 990
column platform_name        format a30
column privilege            format a25
column priv_desc            format a85
column profile              format a20
column program              format a20
column query                format a64
column queue                format a30
column qry                  format a40
column qty                  format 999,999,990
column referenced_name      format a30
column referenced_owner     format a30
column referenced_type      format a20
column referenced_link_name format a30 word_wrapped
column repeat_interval      format a45 word_wrapped
column request              format a40
column req_id               format 9999999999
column resource_name        format a25
column segment_name         format a30
column serial#              format 99999
column sid                  format 99999
column sidserial            format a11
column spid                 format a10
column start_date           format a45 word_wrapped
column stats_date           format a17
column stats_pct            format 999
column status               format a9
column suggest_mb           format 99,999,990
column table_name           format a30
column table_owner          format a15
column tablespace_name      format a25
column tbs                  format a20
column temporary_tablespace format a25
column terminal             format a15
column text                 format a120 word_wrapped
column text_view            format a85 word_wrapped
column time_act             format 9,990.00
column time_avg             format 9,990.00
column time_max             format 9,990.00
column time_min             format 9,990.00
column time_sum             format 9,990.00
column tot                  format a4
column total                format 99,999,990
column total_gb             format 99,990.00
column total_mb             format 99,999,990
column type                 format a18
column used_mb              format 99,999,990
column user_name            format a20
column userhost             format a25
column username             format a30
column value                format a90 word_wrapped
column view_name            format a30
column wait_act             format 9,990.00
column wait_avg             format 9,990.00
column wait_sum             format 99,990.00
column what                 format a40

-- Variables definition
variable b1  varchar2;
variable b2  varchar2;
variable b3  varchar2;
variable b4  varchar2;
variable b5  varchar2;
variable b6  varchar2;
variable b7  varchar2;
variable b8  varchar2;
variable b9  varchar2;
variable b10 varchar2;
variable b11 varchar2;
variable b12 varchar2;
variable b13 varchar2;
variable b14 varchar2;
variable b15 varchar2;

-- Instance and database info.
select 'DB'        type,
      upper (name) c_instance,
      created,
      log_mode     archive,
      null        version,
      null        startup,
      null        parallel,
      flashback_on,
      platform_name
from   gv$database
union all
select 'INST'      type,
      upper (instance_name),
      null        created,
      null        archive,
      version,
      startup_time,
      parallel,
      null        flashback_on,
      null        platform_name
from   gv$instance;

-- Actual connection info.
select ses.sid,
      ses.serial#,
      pro.spid
from   gv$session ses,
      gv$process pro
where  ses.paddr = pro.addr
  and  ses.sid   = (select sid
                  from   gv$mystat
                  where  rownum = 1);

prompt
prompt

set feedback on

