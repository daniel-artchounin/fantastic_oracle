DECLARE 
	nbOfLinesBdeDataCSV NUMBER(10);
BEGIN
	SELECT count(*) INTO nbOfLinesBdeDataCSV FROM f_bde_dataCSV;
	DBMS_OUTPUT.PUT_LINE('Nombre de lignes de f_bde_dataCSV : ' || nbOfLinesBdeDataCSV);
END;
/