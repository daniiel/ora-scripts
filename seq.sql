set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Seq | Shows info of the sequences of a schema.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  21/06/2010 | Creation
--         12/11/2013 | Changes and order of the parameters
--         17/11/2014 | New indentation standard
-- Params: sequence_name owner
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Seq | Shows info of the sequences of a schema.
prompt ------------------------------------------------------------------------------|
prompt Use:     seq owner|% sequence_name|%
prompt Example: seq am_olvera test
prompt ------------------------------------------------------------------------------|

  select sequence_owner,
         sequence_name,
         min_value,
         max_value,
         increment_by,
         cycle_flag,
         last_number
    from dba_sequences
   where sequence_owner like upper ('&1')
     and sequence_name  like upper ('&2')
order by sequence_owner,
         sequence_name;

undefine 1 2
set verify on

