Declare
	nbOfLinesBdtProduit NUMBER(10);
	nbOfLinesBdtDate NUMBER(10);
	nbOfLinesBdtMagasin NUMBER(10);
	nbOfLinesBdlProduit NUMBER(10);
	nbOfLinesBdlDate NUMBER(10);
	nbOfLinesBdlMagasin NUMBER(10);
BEGIN  
	DBMS_OUTPUT.PUT_LINE('');
	DBMS_OUTPUT.PUT_LINE('********************************** Import des données des dimensions **********************************');



	DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de f_dw_produit...');
	manage_constraints('DISABLE', 'f_dw_produit'); 

	dropIndex('idxISBN');

	INSERT INTO f_dw_produit(iSBN, langue, auteurNom, auteurPrenom, publication)
	SELECT C.getISBN(), C.getLangue(), C.getAuteurNom(), C.getAuteurPrenom(), C.getPublication()
	FROM ro_f_bdt_catalogue C;
	COMMIT;

	SELECT COUNT(*) INTO nbOfLinesBdlProduit
	FROM f_dw_produit;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_dw_produit après insertion : ' || nbOfLinesBdlProduit);

	DELETE FROM f_dw_produit
	WHERE iSBN IS NULL;
	COMMIT;

	SELECT COUNT(*) INTO nbOfLinesBdlProduit
	FROM f_dw_produit;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_dw_produit après clean : ' || nbOfLinesBdlProduit);  

	DBMS_OUTPUT.PUT_LINE('Activation des contraintes de f_dw_produit...');
	createIndex('idxISBN', 'f_dw_produit', 'iSBN');  
	manage_constraints('ENABLE', 'f_dw_produit');

	SELECT COUNT(*) INTO nbOfLinesBdtProduit
	FROM ro_f_bdt_catalogue;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_catalogue : ' || nbOfLinesBdtProduit);

	SELECT COUNT(*) INTO nbOfLinesBdlProduit
	FROM f_dw_produit;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_dw_produit : ' || nbOfLinesBdlProduit);



	DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de f_dw_date...');
	manage_constraints('DISABLE', 'f_dw_date');

	dropIndex('idxDateTicket');

	INSERT INTO f_dw_date(dateTicket, jDS, jDA, mois, trimestre, semaine)
	SELECT D.getDate(), D.getJDS(), D.getJDA(), D.getMois(), D.getTrimestre(), D.getSemaine()
	FROM ro_f_bdt_date D;
	COMMIT;

	SELECT COUNT(*) INTO nbOfLinesBdlDate
	FROM f_dw_date;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_dw_date après insertion : ' || nbOfLinesBdlDate);

	DELETE FROM f_dw_date
	WHERE dateTicket IS NULL;
	COMMIT;

	SELECT COUNT(*) INTO nbOfLinesBdlDate
	FROM f_dw_date;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_dw_date après clean : ' || nbOfLinesBdlDate);

	DBMS_OUTPUT.PUT_LINE('Activation des contraintes de f_dw_date...');  

	createIndex('idxDateTicket', 'f_dw_date', 'dateTicket');

	manage_constraints('ENABLE', 'f_dw_date');

	SELECT COUNT(*) INTO nbOfLinesBdtDate
	FROM ro_f_bdt_date;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_date : ' || nbOfLinesBdtDate);

	SELECT COUNT(*) INTO nbOfLinesBdlDate
	FROM f_dw_date;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_dw_date : ' || nbOfLinesBdlDate);



	DBMS_OUTPUT.PUT_LINE('Désactivation des contraintes de f_dw_magasin...');
	manage_constraints('DISABLE', 'f_dw_magasin');

	dropIndex('idxMagasin');

	INSERT INTO f_dw_magasin(magasin, rayonnage, rayonBS, rayonRecent, departement)
	SELECT M.getMagasin(), M.getRayonnage(), M.getRayonBS(), M.getRayonRecent(), M.getDepartement()
	FROM ro_f_bdt_magasin M;
	COMMIT;

	SELECT COUNT(*) INTO nbOfLinesBdlMagasin
	FROM f_dw_magasin;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_dw_magasin après insertion : ' || nbOfLinesBdlMagasin);

	DELETE FROM f_dw_magasin
	WHERE magasin IS NULL;
	COMMIT;

	SELECT COUNT(*) INTO nbOfLinesBdlMagasin
	FROM f_dw_magasin;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_dw_magasin après clean : ' || nbOfLinesBdlMagasin);

	DBMS_OUTPUT.PUT_LINE('Activation des contraintes de f_dw_magasin...');

	createIndex('idxMagasin', 'f_dw_magasin', 'magasin');

	manage_constraints('ENABLE', 'f_dw_magasin');

	SELECT COUNT(*) INTO nbOfLinesBdtMagasin
	FROM ro_f_bdt_magasin;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de ro_f_bdt_magasin : ' || nbOfLinesBdtMagasin);

	SELECT COUNT(*) INTO nbOfLinesBdlMagasin
	FROM f_dw_magasin;

	DBMS_OUTPUT.PUT_LINE('Nombre de tuples de f_dw_magasin : ' || nbOfLinesBdlMagasin);
END;
/

ANALYZE TABLE f_dw_produit COMPUTE STATISTICS;
ANALYZE TABLE f_dw_date COMPUTE STATISTICS;
ANALYZE TABLE f_dw_magasin COMPUTE STATISTICS;