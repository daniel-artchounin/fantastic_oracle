CREATE TABLE f_dw_produit(
    iSBN NUMBER(13, 0),
    langue VARCHAR2(3),
    auteurNom VARCHAR2(30),
    auteurPrenom VARCHAR2(30),
    publication date
  );
  
CREATE UNIQUE INDEX idxISBN
  ON f_dw_produit (iSBN);
ALTER TABLE f_dw_produit 
  ADD CONSTRAINT cstrProduitISBN PRIMARY KEY (iSBN);  
ALTER TABLE f_dw_produit 
  ADD CONSTRAINT cstrProduitISBNLen CHECK (LENGTH(iSBN)= 13);  
ALTER TABLE f_dw_produit 
  ADD CONSTRAINT langueLen CHECK (LENGTH(langue)= 3);