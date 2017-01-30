-- Saber los indices de una tabla (OSDSMANAGER)
SELECT ind.owner,
  ind.tablespace_name tbs,
  ind.index_name,
  ind.status,
  --ind.table_owner,
  col.column_name,
  col.descend
FROM dba_indexes ind,
  dba_ind_columns col
WHERE ind.index_name = col.index_name
AND ind.owner        = col.index_owner
AND ind.table_name   = upper ('ALG_FAIL_GLOBAL')
ORDER BY ind.owner,
  ind.table_owner,
  ind.table_name,
  ind.index_name,
  col.column_position;
  
-- DDL de un indice (ACAADMIN)
select dbms_metadata.get_ddl( 'INDEX', upper('DATE_ID_IX')) FROM DUAL;

-- ------------------------------
--  Explain plan 
-- ------------------------------
DELETE PLAN_TABLE;  

EXPLAIN PLAN FOR  
   SELECT msisdn
   FROM alg_fail_global 
   WHERE id_mno = 2
     AND date_id BETWEEN 20161101 AND 20161220
   GROUP BY msisdn
   HAVING count(*) >= 2;
     
SELECT *
FROM TABLE (dbms_xplan.display);


