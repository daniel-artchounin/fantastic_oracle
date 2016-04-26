CREATE TABLE f_dw_magasin(
  magasin VARCHAR2(4),
  rayonnage VARCHAR2(1),
  rayonBS NUMBER(1),
  rayonRecent NUMBER(1),
  departement NUMBER(3)
);

CREATE UNIQUE INDEX idxMagasin
  ON f_dw_magasin(magasin);
ALTER TABLE f_dw_magasin 
  ADD CONSTRAINT cstrMagasin PRIMARY KEY (magasin);  
ALTER TABLE f_dw_magasin 
  ADD CONSTRAINT cstrMagasinRayonnage CHECK (rayonnage IN ('Y', 'E', 'A')); 
ALTER TABLE f_dw_magasin 
  ADD CONSTRAINT cstrMagasinRayonBS CHECK (rayonBS IN (0, 1)); 
ALTER TABLE f_dw_magasin 
  ADD CONSTRAINT cstrMagasinRayonRecent CHECK (rayonRecent IN (0, 1)); 