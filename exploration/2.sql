/* Effectuez une requête pour étudier les ventes en fonction du 
rayonnage. */
SELECT M.rayonnage AS r1, COUNT(*) AS q1
FROM f_dw_ventes V, f_dw_magasin M
WHERE V.fkMagasin=M.magasin
GROUP BY M.rayonnage
ORDER BY q1 DESC;


/* Effectuez une seconde requête pour étudier la proportion des 
rayonnages. */
SELECT M.rayonnage AS r2, COUNT(*) AS q2
FROM f_dw_magasin M
GROUP BY M.rayonnage
ORDER BY q2 DESC; 


/* Ajuster le résultat en fonction de la proportion de magasins de 
chaque type de rayonnage. */
SELECT R1.r1 AS rayonnage, R1.q1 AS Ventes, R2.q2 AS Mag, ROUND(R1.q1/R2.q2) AS VentesParMag FROM(
  SELECT M.rayonnage AS r1, COUNT(*) AS q1
  FROM f_dw_ventes V, f_dw_magasin M
  WHERE V.fkMagasin=M.magasin
  GROUP BY M.rayonnage 
)R1,(
  SELECT M.rayonnage AS r2, COUNT(*) AS q2
  FROM f_dw_magasin M
  GROUP BY M.rayonnage
) R2
WHERE r1=r2
ORDER BY VentesParMag DESC;
