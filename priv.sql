set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Priv | Shows the privileges of a role or user.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  01/10/2009 | Creation
--         02/09/2011 | Filters for privilege type and its description added
--         17/11/2014 | New indentation standard
-- Params: grantee priv_type priv_desc
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Priv | Shows the privileges of a role or user.
prompt ------------------------------------------------------------------------------|
prompt Use:     priv grantee|% priv_type(tab|sys|role|%) priv_desc|%
prompt Example: priv am_olvera tab resour%
prompt ------------------------------------------------------------------------------|

  select grantee,
         priv_type,
         priv_desc
    from (select grantee,
                 'TAB'        priv_type,
                 owner      || '.' ||
                 table_name || '_' ||
                 privilege    priv_desc
            from dba_tab_privs
          union
          select grantee,
                 'ROLE'       priv_type,
                 granted_role priv_desc
            from dba_role_privs
          union
          select grantee,
                 'SYS'        priv_type,
                 privilege    priv_desc
            from dba_sys_privs)
   where grantee   like upper ('&1')
     and priv_type like upper ('&2')
     and priv_desc like upper ('&3')
order by grantee,
         priv_type,
         priv_desc;

undefine 1 2 3
set verify on

