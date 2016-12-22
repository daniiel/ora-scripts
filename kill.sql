set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: Kill | Kills any session but SYS and SYSTEM.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  21/06/2010 | Creation
--         17/11/2014 | New indentation standard
-- Params: user_name
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt Kill | Kills any session but SYS and SYSTEM.
prompt ------------------------------------------------------------------------------|
prompt Use:     kill user_name|%
prompt Example: kill am_olvera
prompt ------------------------------------------------------------------------------|

declare
  type ses_record is record (                /* Record type for sessions. */
    sid      v$session.sid%type,
    serial#  v$session.serial#%type,
    username v$session.username%type
  );

  cursor c is select ses.sid,                /* Cursor to review the sessions. */
                     ses.serial#,
                     ses.username
                from v$session ses,
                     v$process pro
               where ses.paddr         = pro.addr
                 and ses.username not in ('SYS', 'SYSTEM')
                 and ses.username   like upper ('&1');
  
  lr_session ses_record;
begin
  /* Open the cursor and kill each session. */
  open c;
  loop
    fetch c into lr_session;
    exit when c%notfound;
    
    begin
      execute immediate 'alter system kill session ''' || lr_session.sid || ',' || lr_session.serial# || ''' immediate';
      dbms_output.put_line ('Session '  || lr_session.username ||
                            ' sid-'     || lr_session.sid      ||
                            ' serial#-' || lr_session.serial#  || ' killed.');
    exception
      when others then
        dbms_output.put_line ('Error with session: ' || lr_session.username || ' sid-' || lr_session.sid || ' serial#-' || lr_session.serial#);
    end;
  end loop;
  close c;
end;
/

undefine 1
set verify on

