Declare
  nbOfLinesBdtVentes NUMBER(10);
  nbOfLinesBdlVentes NUMBER(10);
BEGIN  
  SELECT COUNT(*) INTO nbOfLinesBdtVentes FROM ro_f_bdt_vente;
  DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de f_dw_ventes...');
  manage_constraints('DISABLE', 'f_dw_ventes');
    
  INSERT INTO f_dw_ventes(ticket, fkDate, fKProduit, fKMagasin)
  SELECT V.getTicket(), V.getDateTicket(), V.getProduit(), V.getMagasin()
  FROM ro_f_bdt_vente V
  WHERE ROWNUM < 5000;

  SELECT COUNT(*) INTO nbOfLinesBdlVentes
  FROM f_dw_ventes;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_dw_magasin après insertion : ' || nbOfLinesBdlVentes);  
  
  DELETE FROM f_dw_ventes
  WHERE fKProduit NOT IN (
    SELECT iSBN FROM f_dw_produit
  ) OR fKMagasin NOT IN (
    SELECT magasin FROm f_dw_magasin
  );
  
  SELECT COUNT(*) INTO nbOfLinesBdlVentes
  FROM f_dw_ventes;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_dw_magasin après clean : ' || nbOfLinesBdlVentes);  
  
  DBMS_OUTPUT.PUT_LINE('Activation des contraintes de f_dw_ventes...');
  manage_constraints('ENABLE', 'f_dw_ventes');
  
  SELECT COUNT(*) INTO nbOfLinesBdtVentes
  FROM ro_f_bdt_vente;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_vente : ' || nbOfLinesBdtVentes);
  
  SELECT COUNT(*) INTO nbOfLinesBdlVentes
  FROM f_dw_ventes;

  DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_dw_ventes : ' || nbOfLinesBdlVentes);
END;
/