CREATE OR REPLACE VIEW f_bde_catalogue(isbn, auteur, titre, langue, publication)
AS 
SELECT isbn, auteur, titre, langue, publication FROM nf26.catalogue;