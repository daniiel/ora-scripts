set verify off
--------------------------------------------------------------------------------------------------------------
-- Script: PatLev | Shows the E-Business patch level.
-- Author: Orlando Olguin Olvera | oranswer.wordpress.com | orlandoolguin.wordpress.com
-- Dates:  09/02/2014 | Creation
-- Params: patch_level
--------------------------------------------------------------------------------------------------------------
prompt ------------------------------------------------------------------------------|
prompt PatLev | Shows the E-Business patch level.
prompt ------------------------------------------------------------------------------|
prompt Use:     patlev patch_level|%
prompt Example: patlev %bom%
prompt ------------------------------------------------------------------------------|

  select substr (apl.application_short_name, 1, 8) product,
       substr (apt.application_name, 1, 25)      application_name,
       language                                  lang,  
       decode (ins.status, 'I', 'Installed',
                           'S', 'Shared',
                           'N', 'Not installed') patch_status,
       apl.basepath,
       substr (ins.patch_level, 1, 11)           patch_level,
/*       substr (ins.product_version, 1, 14)       version,*/
       ins.tablespace,
       ins.index_tablespace
    from fnd_application           apl,
       fnd_application_tl        apt,
       fnd_product_installations ins
   where apl.application_id = apt.application_id
     and apl.application_id = ins.application_id
     and ins.patch_level like upper ('&1')
order by application_short_name, lang;

undefine 1
set verify on

