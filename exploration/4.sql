/* Calculer le nombre moyen de ventes pour un livre. */
SELECT ROUND(AVG(R.quantity)) AS q
FROM
(
	SELECT P.iSBN, COUNT(*) AS quantity 
	FROM f_dw_ventes V, f_dw_produit P
	WHERE V.fkProduit = P.iSBN
	GROUP BY P.iSBN
) R;


/* Étudier l'évolution du nombre de ventes (par exemple 
avec un graphique) et observer une singularité dans 
l'évolution du nombre de ventes par livre.*/
@evolution_nombre_ventes.sql


/* Créez une vue qui liste les livres selon qu'ils sont 
des best-sellers ou non (on ajoute un attribut booléen "bs"). 
Expliciter votre définition d'un best-seller.*/

CREATE OR REPLACE VIEW BestSeller AS
SELECT R.iSBN
FROM(
	SELECT P.iSBN, COUNT(*) AS quantity
	FROM f_dw_ventes V, f_dw_produit P
	WHERE V.fkProduit = P.iSBN
	GROUP BY P.iSBN
	ORDER BY quantity DESC
)R WHERE rownum <= 10;

SELECT * 
FROM BestSeller;

/* On considère ici que les best-seller sont les 10 livres 
les plus vendus. */