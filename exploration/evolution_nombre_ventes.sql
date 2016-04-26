SET HEADING OFF
SET FEEDBACK OFF
SET ECHO OFF
SET PAGESIZE 50000
SPOOL ./test.csv
SELECT P.iSBN || ';"' || P.langue || '";' || P.publication || ';' || COUNT(*) AS quantity
FROM f_dw_ventes V, f_dw_produit P
WHERE V.fkProduit = P.iSBN
GROUP BY P.iSBN, P.langue, P.publication;
SPOOL OFF
SET HEADING ON
SET FEEDBACK ON