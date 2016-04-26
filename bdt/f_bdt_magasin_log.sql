DECLARE
	nbOfLinesBdeDepartements NUMBER(10);
	nbOfLinesBdtMarketing NUMBER(10);
	nbOfLinesBdtDJoinBdtM NUMBER(10);
BEGIN
	SELECT COUNT(*) INTO nbOfLinesBdeDepartements
	FROM f_bde_departements;

	SELECT COUNT(*) INTO nbOfLinesBdtMarketing
	FROM f_bde_marketing;

	SELECT COUNT(*) INTO nbOfLinesBdtDJoinBdtM
	FROM f_bdt_vdpt DPT, f_bdt_vmarketing M
	WHERE DPT.numDepartement = M.departement;

	DBMS_OUTPUT.PUT_LINE('Nombre de lignes de f_bde_departements : ' || nbOfLinesBdeDepartements);
	DBMS_OUTPUT.PUT_LINE('Nombre de lignes de f_bde_marketing : ' || nbOfLinesBdtMarketing);
	DBMS_OUTPUT.PUT_LINE('Nombre de lignes de f_bdt_vdpt JOIN f_bdt_vmarketing : ' || nbOfLinesBdtDJoinBdtM);
END;
/