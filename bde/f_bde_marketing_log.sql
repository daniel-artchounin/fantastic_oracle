DECLARE
	nbOfLinesBdeMarketing NUMBER(10);
BEGIN
	SELECT COUNT(*) INTO nbOfLinesBdeMarketing FROM f_bde_marketing;
	DBMS_OUTPUT.PUT_LINE('Nombre de lignes de f_bde_marketing : ' || nbOfLinesBdeMarketing);
END;
/