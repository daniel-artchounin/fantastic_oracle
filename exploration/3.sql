/* Déduisez des résultats de l'analyse par le rayonnage 
qu'une isolation de facteur peut être envisagée. Expliquez 
pourquoi et dans quels cas. Expliquez pourquoi et dans 
quels cas. Implémentez la vue correspondante. */


/* Nombre de ventes par type de magasin (presence BS ou 
absence BS) */
SELECT M.rayonBS AS r1, COUNT(*) AS q1
FROM f_dw_ventes V, f_dw_magasin M
WHERE V.fkMagasin=M.magasin
GROUP BY M.rayonBS;


/* Nombre de magasins avec (presence BS ou absence 
BS) */
SELECT M.rayonBS AS r2, COUNT(*) AS q2
FROM f_dw_magasin M
GROUP BY M.rayonBS; 


/* Nombre moyen de ventes pour chaque type de magasin 
(presence BS ou absence BS) */
SELECT R1.r1 AS rayonnage, R1.q1 AS Ventes, R2.q2 AS Mag, ROUND(R1.q1 / R2.q2) AS VentesParMag FROM
(
    SELECT M.rayonBS AS r1, COUNT(*) AS q1
    FROM f_dw_ventes V, f_dw_magasin M
    WHERE V.fkMagasin=M.magasin
    GROUP BY M.rayonBS
)R1, (
    SELECT M.rayonBS AS r2, COUNT(*) AS q2
    FROM f_dw_magasin M
    GROUP BY M.rayonBS
)R2
WHERE r1=r2
ORDER BY VentesParMag DESC;


/* Nombre de ventes par type de magasin (presence BS ou 
absence BS) uniquement pour les magasins avec rayonnage 'A' */
SELECT M.rayonBS AS r1, COUNT(*) AS q1
FROM f_dw_ventes V, f_dw_magasin M
WHERE V.fkMagasin=M.magasin AND M.rayonnage = 'A'
GROUP BY M.rayonBS;


/* Nombre de magasins avec (presence BS ou absence 
BS) uniquement pour les magasins avec rayonnage 'A' */
SELECT M.rayonBS AS r2, COUNT(*) AS q2
FROM f_dw_magasin M
WHERE M.rayonnage = 'A'
GROUP BY M.rayonBS; 

SELECT R1.r1 AS rayonnage, R1.q1 AS Ventes, R2.q2 AS Mag, ROUND(R1.q1 / R2.q2) AS VentesParMagA FROM
(
    SELECT M.rayonBS AS r1, COUNT(*) AS q1
    FROM f_dw_ventes V, f_dw_magasin M
    WHERE V.fkMagasin=M.magasin AND M.rayonnage = 'A'
    GROUP BY M.rayonBS
) R1, (
    SELECT M.rayonBS AS r2, COUNT(*) AS q2
    FROM f_dw_magasin M
    WHERE M.rayonnage = 'A'
    GROUP BY M.rayonBS
) R2
WHERE r1=r2
ORDER BY VentesParMagA DESC;
/* Résultats pas très semblables mais on va quand même implémenter la vue
correspondant aux magasins avec un rayonnage A. */


/* Implémentez la vue correspondante. */
CREATE VIEW MagasinsAvecRayonnageA AS
SELECT *
FROM f_dw_magasin M
WHERE M.rayonnage = 'A';

SELECT COUNT(*) FROM MagasinsAvecRayonnageA;