CREATE TABLE f_dw_ventes(
	ticket NUMBER(9),
	fkDate date,
	fkProduit NUMBER(13),
	fkMagasin VARCHAR2(4)
);

ALTER TABLE f_dw_ventes 
	ADD CONSTRAINT cstrFkDate FOREIGN KEY(fkDate) REFERENCES f_dw_date(dateTicket)
	/*ADD CONSTRAINT cstrFkProduit FOREIGN KEY(fkProduit) REFERENCES f_dw_produit(iSBN);*/
	ADD CONSTRAINT cstrFkMagasin FOREIGN KEY(fkMagasin) REFERENCES f_dw_magasin(magasin);