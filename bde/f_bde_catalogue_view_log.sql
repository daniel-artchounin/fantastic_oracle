DECLARE
	nbOfLinesBdeCatalogue NUMBER(10);
BEGIN
	DBMS_OUTPUT.PUT_LINE('Création de la vue f_bde_catalogue');
	SELECT count(*) INTO nbOfLinesBdeCatalogue FROM f_bde_catalogue; -- Affiche nombre de bouquins : 1422 
	DBMS_OUTPUT.PUT_LINE('Nombre de lignes de f_bde_catalogue : ' || nbOfLinesBdeCatalogue);
END;
/