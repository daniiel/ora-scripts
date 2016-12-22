--------------------------------------------------------------------------------------------------------------
-- Script: TrcOFF | Turns off the trace event 10046.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  30/11/2009 | Creation
-- Params: none
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt TrcOFF | Turns off the trace event 10046.
prompt ------------------------------------------------------------------------------|
prompt Use:     trcoff
prompt Example: trcoff
prompt ------------------------------------------------------------------------------|

oradebug event 10046 trace name context off;

