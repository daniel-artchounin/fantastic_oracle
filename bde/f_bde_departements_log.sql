DECLARE 
	nbOfLinesBdeDepartements NUMBER(10);
BEGIN
	SELECT COUNT(*) INTO nbOfLinesBdeDepartements FROM f_bde_departements;
	DBMS_OUTPUT.PUT_LINE('Nombre de lignes de f_bde_departements : ' || nbOfLinesBdeDepartements);
END;
/