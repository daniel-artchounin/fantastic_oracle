Declare
  nbOfLinesBdECatalogue NUMBER(10, 0);
  nbOfLinesBdtCatalogue  NUMBER(10, 0);
  nbOfLinesBdtMagasin NUMBER(10, 0);
  nbOfLinesBdeDepartement NUMBER(10, 0);
  nbOfLinesBdeMarketing NUMBER(10, 0);
  nbOfLinesBdtDate NUMBER(10, 0);
  nbOfLinesBdeDateDataCsv NUMBER(10, 0);
  nbOfLinesBdtVente NUMBER(10, 0);
  nbOfLinesBdeVenteDataCsv NUMBER(10, 0);
BEGIN
  -- Supression du contenu des tables --
  DBMS_OUTPUT.PUT_LINE('Suppression des tuples de ro_f_bdt_catalogue...');
  DELETE FROM ro_f_bdt_catalogue;
  DBMS_OUTPUT.PUT_LINE('Suppression des tuples de ro_f_bdt_magasin...');
  DELETE FROM ro_f_bdt_magasin;
  DBMS_OUTPUT.PUT_LINE('Suppression des tuples de ro_f_bdt_date...');
  DELETE FROM ro_f_bdt_date;
  DBMS_OUTPUT.PUT_LINE('Suppression des tuples de ro_f_bdt_vente...');
  DELETE FROM ro_f_bdt_vente;  
  
    -- Désactivation des contraintes --
  DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de ro_f_bdt_vente...');
  manage_constraints('DISABLE', 'ro_f_bdt_vente');  
  DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de ro_f_bdt_catalogue...');
  manage_constraints('DISABLE', 'ro_f_bdt_catalogue');
  DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de ro_f_bdt_magasin...');
  manage_constraints('DISABLE', 'ro_f_bdt_magasin');
  DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de ro_f_bdt_date...');
  manage_constraints('DISABLE', 'ro_f_bdt_date');

  -- Insertion dans ro_f_bdt_catalogue  --
  DBMS_OUTPUT.PUT_LINE('Insertion dans ro_f_bdt_catalogue...');
  INSERT INTO ro_f_bdt_catalogue
  SELECT iSBN, auteur, titre, langue, publication
  FROM f_bde_catalogue;
  -- WHERE ROWNUM <= 1000;

  SELECT COUNT(*) INTO nbOfLinesBdtCatalogue
  FROM ro_f_bdt_catalogue;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_catalogue : ' || nbOfLinesBdtCatalogue);
  

  SELECT COUNT(*) INTO nbOfLinesBdECatalogue 
  FROM f_bde_catalogue;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_bde_catalogue : ' || nbOfLinesBdECatalogue);

  DBMS_OUTPUT.PUT_LINE('Insertion dans ro_f_bdt_magasin...');
  INSERT INTO ro_f_bdt_magasin
  SELECT M.magasin, DPT.numDepartement, DPT.nomDepartement, DPT.population, M.rayonnage, M.rayonnageExplicite, M.rayonBS, M.rayonRecent
  FROM f_bdt_vdpt DPT, f_bdt_vmarketing M
  WHERE DPT.numDepartement = M.departement;
  -- AND DPT.ROWNUM <= 1000;  

  SELECT COUNT(*) INTO nbOfLinesBdtMagasin
  FROM ro_f_bdt_magasin;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_magasin : ' || nbOfLinesBdtMagasin);

  SELECT COUNT(*) INTO nbOfLinesBdeDepartement 
  FROM f_bdt_vdpt;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_bdt_vdpt: ' || nbOfLinesBdeDepartement);

  SELECT COUNT(*) INTO nbOfLinesBdeMarketing 
  FROM f_bdt_vmarketing;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_bdt_vmarketing : ' || nbOfLinesBdeMarketing);
  /**/
  DBMS_OUTPUT.PUT_LINE('Insertion dans  ro_f_bdt_date...');
  INSERT INTO ro_f_bdt_date
  SELECT DISTINCT dateTicket
  FROM f_bde_datacsv;

  SELECT COUNT(*) INTO nbOfLinesBdtDate
  FROM ro_f_bdt_date;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_date : ' || nbOfLinesBdtDate);

  SELECT COUNT(*) INTO nbOfLinesBdeDateDataCsv 
  FROM (
    SELECT DISTINCT dateTicket
    FROM f_bde_datacsv
  );

  DBMS_OUTPUT.PUT_LINE('Nombre de date de f_bde_datacsv : ' || nbOfLinesBdeDateDataCsv);
  /**/
  DBMS_OUTPUT.PUT_LINE('Insertion dans  ro_f_bdt_vente...');
  INSERT INTO ro_f_bdt_vente
  SELECT ticket, dateTicket, iSBN, magasin
  FROM f_bde_datacsv;
  -- WHERE ROWNUM <= 1000; 

  SELECT COUNT(*) INTO nbOfLinesBdtVente
  FROM ro_f_bdt_vente;
  
  SELECT COUNT(*) INTO nbOfLinesBdeVenteDataCsv
  FROM f_bde_datacsv;
  
  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_vente : ' || nbOfLinesBdtVente);

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_bde_datacsv : ' || nbOfLinesBdeVenteDataCsv);/**/
  
  DBMS_OUTPUT.PUT_LINE('Nettoyage partiel de ro_f_bdt_vente'); 

  SELECT COUNT(*) INTO nbOfLinesBdtVente 
  FROM ro_f_bdt_vente;
  
  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_vente : ' || nbOfLinesBdtVente);

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_bde_datacsv : ' || nbOfLinesBdeVenteDataCsv);/**/
  
  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_catalogue : ' || nbOfLinesBdtCatalogue);
  DBMS_OUTPUT.PUT_LINE('Activation des contraintes de ro_f_bdt_catalogue...');
  manage_constraints('ENABLE', 'ro_f_bdt_catalogue');
  SELECT COUNT(*) INTO nbOfLinesBdtCatalogue
  FROM ro_f_bdt_catalogue;
  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_catalogue : ' || nbOfLinesBdtCatalogue);
  
  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_magasin : ' || nbOfLinesBdtMagasin);
  DBMS_OUTPUT.PUT_LINE('Activation des contraintes de ro_f_bdt_magasin...');
  manage_constraints('ENABLE', 'ro_f_bdt_magasin');
  SELECT COUNT(*) INTO nbOfLinesBdtMagasin
  FROM ro_f_bdt_magasin;
  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_magasin : ' || nbOfLinesBdtMagasin);
  
  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_date : ' || nbOfLinesBdtDate);
  DBMS_OUTPUT.PUT_LINE('Activation des contraintes de ro_f_bdt_date...');
  manage_constraints('ENABLE', 'ro_f_bdt_date');
  SELECT COUNT(*) INTO nbOfLinesBdtDate
  FROM ro_f_bdt_date;
  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_date : ' || nbOfLinesBdtDate);
  
  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_vente : ' || nbOfLinesBdtVente);
  DBMS_OUTPUT.PUT_LINE('Activation des contraintes de ro_f_bdt_vente...');
  manage_constraints('ENABLE', 'ro_f_bdt_vente');  
  SELECT COUNT(*) INTO nbOfLinesBdtVente 
  FROM ro_f_bdt_vente;
  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_vente : ' || nbOfLinesBdtVente); 
END;
/
-- spool off;