set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: LogHis | Shows the most recent log switches by day, day_hour.
-- Adaptd: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  16/08/2013 | Adaptation
-- Params: instance
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt LogHis | Shows the most recent log switches by day, day_hour.
prompt ------------------------------------------------------------------------------|
prompt Use:     loghis instance|%
prompt Example: loghis 1
prompt ------------------------------------------------------------------------------|

select inst_id,
       to_char (first_time, 'yyyymmdd') day,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '00', 1, 0)), '999') HR00,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '01', 1, 0)), '999') HR01,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '02', 1, 0)), '999') HR02,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '03', 1, 0)), '999') HR03,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '04', 1, 0)), '999') HR04,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '05', 1, 0)), '999') HR05,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '06', 1, 0)), '999') HR06,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '07', 1, 0)), '999') HR07,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '08', 1, 0)), '999') HR08,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '09', 1, 0)), '999') HR09,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '10', 1, 0)), '999') HR10,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '11', 1, 0)), '999') HR11,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '12', 1, 0)), '999') HR12,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '13', 1, 0)), '999') HR13,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '14', 1, 0)), '999') HR14,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '15', 1, 0)), '999') HR15,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '16', 1, 0)), '999') HR16,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '17', 1, 0)), '999') HR17,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '18', 1, 0)), '999') HR18,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '19', 1, 0)), '999') HR19,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '20', 1, 0)), '999') HR20,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '21', 1, 0)), '999') HR21,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '22', 1, 0)), '999') HR22,
       to_char (sum (decode (substr (to_char (first_time, 'HH24'), 1, 2), '23', 1, 0)), '999') HR23,
       to_char (count (*), '999') TOT
from   gv$log_history
where  inst_id like '&1'
group by inst_id,
         to_char (first_time, 'yyyymmdd')
order by inst_id,
         day;

undefine 1
set verify on

