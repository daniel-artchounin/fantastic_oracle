DECLARE
  nbOfLinesBdeDepartements NUMBER(10);
  nbOfLinesBdtMarketing NUMBER(10);
  nbOfLinesBdtDJoinBdtM NUMBER(10);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Création de la vue f_bdt_vdpt');
    DBMS_OUTPUT.PUT_LINE('Création de la vue f_bdt_vmarketing');

    SELECT COUNT(*) INTO nbOfLinesBdeDepartements
    FROM f_bde_departementsinsee2003;

    SELECT COUNT(*) INTO nbOfLinesBdtMarketing
    FROM f_bdt_vmarketing;

    SELECT COUNT(*) INTO nbOfLinesBdtDJoinBdtM
    FROM f_bdt_vdpt DPT, f_bdt_vmarketing M
    WHERE DPT.numDepartement = M.departement;

    DBMS_OUTPUT.PUT_LINE('Nombre de lignes de f_bde_departementsinsee2003 : ' || nbOfLinesBdeDepartements);
    DBMS_OUTPUT.PUT_LINE('Nombre de lignes de f_bdt_vmarketing : ' || nbOfLinesBdtMarketing);
    DBMS_OUTPUT.PUT_LINE('Nombre de lignes de f_bdt_vdpt JOIN f_bdt_vmarketing : ' || nbOfLinesBdtDJoinBdtM);

    DBMS_OUTPUT.PUT_LINE('Création du type objet f_bdt_magasin');
    DBMS_OUTPUT.PUT_LINE('Création de la table objet ro_f_bdt_magasin');
END;
/