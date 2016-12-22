set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: KilSes | Elimina una sesion de acuerdo a su SID y SERIAL#.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  04/10/2009 | Creation
-- Params: sid serial#
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt KilSes | Elimina una sesion de acuerdo a su SID y SERIAL#.
prompt ------------------------------------------------------------------------------|
prompt Use:     kilses sid serial#
prompt Example: kilses 433 22
prompt ------------------------------------------------------------------------------|

prompt Elimina sesion &1 con serial# &2
alter system kill session '&1,&2';

undefine 1 2
set verify on

