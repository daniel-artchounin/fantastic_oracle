/* Effectuez une requête de type GROUP BY pour étudier les ventes 
en fonction du jour de la semaine. */
SELECT D.jDS, COUNT(*) AS q
FROM f_dw_ventes V, f_dw_date D
WHERE V.fkDate=D.dateTicket
GROUP BY D.jDS
ORDER BY q DESC;


/* Écrivez une requête avec sous-requête dans la clause FROM pour 
trouver la moyenne des ventes des jours hors samedi. */
SELECT AVG(R.q)
FROM (
	SELECT D.jDS, COUNT(*) AS q
	FROM f_dw_ventes V, f_dw_date D
	WHERE V.fkDate=D.dateTicket
	GROUP BY D.jDS
	HAVING D.jDS != 6
	ORDER BY q DESC
) R;


/* Moyenne des ventes pour chaque jour de la semaine hormis le 
samedi */
SELECT R.dayOfWeek, AVG(R.quantity) AS q
FROM
(
	SELECT D.dateTicket, D.jDS AS dayOfWeek, COUNT(*) AS quantity 
	FROM f_dw_ventes V, f_dw_date D
	WHERE V.fkDate = D.dateTicket
	GROUP BY D.dateTicket, D.jDS
	HAVING D.jDS != 6
) R
GROUP BY R.dayOfWeek
ORDER BY q;


/* Transformez la première requête permettant de calculer les ventes 
en fonction du jour de la semaine en une vue. */
CREATE OR REPLACE VIEW VentesFonctionJour
AS
SELECT D.jDS, COUNT(*) AS q
FROM f_dw_ventes V, f_dw_date D
WHERE V.fkDate=D.dateTicket
GROUP BY D.jDS
ORDER BY q DESC;

SELECT * FROM VentesFonctionJour;


/* Ajouter deux autres vues : la première calculera la moyenne des 
ventes hors samedi */
CREATE OR REPLACE VIEW MoyenneVentesFonctionJour
AS
SELECT AVG(R.q) AS moyenne
FROM (
	SELECT D.jDS, COUNT(*) AS q
	FROM f_dw_ventes V, f_dw_date D
	WHERE V.fkDate=D.dateTicket
	GROUP BY D.jDS
	HAVING D.jDS != 6
	ORDER BY q DESC
) R;

SELECT * FROM MoyenneVentesFonctionJour;


/* Ajouter deux autres vues : la seconde le ratio de ventes le samedi 
par rapport à la moyenne */
CREATE OR REPLACE VIEW RatioVentesSamediParRappMoy
AS
SELECT VFJ.jDS, ROUND(VFJ.q / MVFJ.moyenne, 3) AS ratio
FROM VentesFonctionJour VFJ, MoyenneVentesFonctionJour MVFJ
ORDER BY ratio DESC;

SELECT * FROM RatioVentesSamediParRappMoy;