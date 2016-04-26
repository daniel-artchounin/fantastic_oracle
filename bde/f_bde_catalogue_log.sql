DECLARE 
	nbOfLinesBdeDataCSV NUMBER(10);
BEGIN
	DBMS_OUTPUT.PUT_LINE('Création de la table externe f_bde_dataCSV');

	SELECT count(*) INTO nbOfLinesBdeDataCSV FROM f_bde_dataCSV;
	DBMS_OUTPUT.PUT_LINE('Nombre de lignes de f_bde_departementsInsee2003 : ' || nbOfLinesBdeDataCSV);

END;
/