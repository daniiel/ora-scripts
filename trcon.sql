set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: TrcON | Turns on the trace event 10046.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  30/11/2009 | Creation
-- Params: level
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt TrcON | Turns on the trace event 10046.
prompt ------------------------------------------------------------------------------|
prompt Use:     trcon level (1 | 4 | 8 |12)
prompt Example: trcon 8
prompt ------------------------------------------------------------------------------|

oradebug event 10046 trace name context forever, level &1;

undefine 1
set verify on

