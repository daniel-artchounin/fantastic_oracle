DECLARE 
	nbOfLinesBdeDepartements NUMBER(10);
BEGIN
	DBMS_OUTPUT.PUT_LINE('Création de la table externe f_bde_departementsInsee2003');

	SELECT COUNT(*) INTO nbOfLinesBdeDepartements FROM f_bde_departementsInsee2003;
	DBMS_OUTPUT.PUT_LINE('Nombre de lignes de f_bde_departementsInsee2003 : ' || nbOfLinesBdeDepartements);
END;
/