set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Syn | Shows synonyms of the database.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  21/06/2010 | Creation
-- Params: syn_owner synonym_name obj_owner object_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Syn | Shows synonyms of the database.
prompt ------------------------------------------------------------------------------|
prompt Use:     syn syn_owner|% synonym_name|% obj_owner|% object_name|%
prompt Example: syn am_olvera employ% % employees
prompt ------------------------------------------------------------------------------|

  select syn.owner,
         syn.synonym_name,
         syn.table_owner,
         syn.table_name,
         obj.status,
         syn.db_link db_link_2
    from dba_synonyms syn,
         dba_objects  obj
   where syn.owner           = obj.owner
     and syn.synonym_name    = obj.object_name
     and obj.object_type     = 'SYNONYM'
     and syn.owner        like upper ('&1')
     and syn.synonym_name like upper ('&2')
     and syn.table_owner  like upper ('&3')
     and syn.table_name   like upper ('&4')
order by syn.owner,
         syn.synonym_name;

undefine 1 2 3 4
set verify on

