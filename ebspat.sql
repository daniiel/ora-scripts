set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: EBSPat | Shows information about patches in the Oracle E-Business.
-- Adaptd: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  01/07/2014 | Adaptation
--         20/11/2014 | New indentation standard
-- Params: patch_number
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt EBSPat | Shows information about patches in the Oracle E-Business.
prompt ------------------------------------------------------------------------------|
prompt Use:     ebspat patch_number|%
prompt Example: ebspat 189901
prompt ------------------------------------------------------------------------------|

  select ptc.patch_name,
         ptc.patch_type,
         drv.driver_file_name,
         drv.patch_abstract,
         to_char (drv.creation_date, 'dd/mm/yyyy hh24:mi:ss') creation_date,
         drv.platform,
         lan.nls_language
    from ad_applied_patches    ptc,
         ad_patch_drivers      drv,
         ad_patch_driver_langs dln,
         fnd_languages         lan
   where ptc.applied_patch_id    = drv.applied_patch_id
     and drv.patch_driver_id     = dln.patch_driver_id
     and dln.language            = lan.language_code
	   and ptc.patch_name       like '&1'
order by drv.creation_date;

undefine 1
set verify on

