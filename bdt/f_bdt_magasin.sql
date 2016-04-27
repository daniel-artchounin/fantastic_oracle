CREATE OR REPLACE VIEW f_bdt_vdpt AS
SELECT * 
FROM f_bde_departements;

CREATE OR REPLACE VIEW f_bdt_vmarketing(magasin, departement, rayonnage, rayonnageExplicite, rayonBS, rayonRecent) 
AS
SELECT magasin, CASE WHEN SUBSTR(departement, 1, 1) = '0' THEN SUBSTR(departement, 2)   
	ELSE departement END departement, rayonnage, rayonnageExplicite, rayonBS, rayonRecent
FROM f_bde_marketing;

CREATE OR REPLACE TYPE f_bdt_magasin AS OBJECT (
	magasin VARCHAR2(10),
	departement VARCHAR2(10),
	nomDepartement VARCHAR2(30),
	population NUMBER(10),
	rayonnage CHAR(1),
	rayonnageExplicite VARCHAR2(10),
	rayonBS VARCHAR2(2),
	rayonRecent VARCHAR2(2),
	MEMBER FUNCTION getDepartement RETURN NUMBER,
	MEMBER FUNCTION getNomDepartement RETURN VARCHAR2,
	MEMBER FUNCTION getPopulation RETURN NUMBER,
	MEMBER FUNCTION getMagasin RETURN VARCHAR2,
	MEMBER FUNCTION getRayonnage RETURN CHAR,
	MEMBER FUNCTION getRayonnageExplicite RETURN VARCHAR2,
	MEMBER FUNCTION getRayonBS RETURN NUMBER,
	MEMBER FUNCTION getRayonRecent RETURN NUMBER
);-- [NOT FINAL];
/

CREATE OR REPLACE TYPE BODY f_bdt_magasin
IS 
	MEMBER FUNCTION getMagasin RETURN VARCHAR2
	IS
	BEGIN
		IF SUBSTR(SELF.magasin, 1, 1) = 'M' THEN 
			RETURN SELF.magasin;
		ELSE
			RETURN NULL;
		END IF;
	END;

	MEMBER FUNCTION getDepartement RETURN NUMBER
	IS
	BEGIN
		RETURN TO_NUMBER(SELF.departement);
	END;

	MEMBER FUNCTION getNomDepartement RETURN VARCHAR2
	IS
	BEGIN
		RETURN TRIM(SELF.nomDepartement);
	END;

	MEMBER FUNCTION getPopulation RETURN NUMBER
	IS
	BEGIN
		RETURN TO_NUMBER(SELF.population);
	END;

	MEMBER FUNCTION getRayonnage RETURN CHAR
	IS
	BEGIN
		RETURN TRIM(SELF.rayonnage);
	END;

	MEMBER FUNCTION getRayonnageExplicite RETURN VARCHAR2
	IS
	BEGIN
		RETURN TRIM(SELF.rayonnageExplicite);
	END;

	MEMBER FUNCTION getRayonBS RETURN NUMBER
	IS
	BEGIN
		RETURN TO_NUMBER(SELF.rayonBS);
	END; 

	MEMBER FUNCTION getRayonRecent RETURN NUMBER
	IS
	BEGIN
		RETURN TO_NUMBER(SELF.rayonRecent);
	END;   
END;
/

CREATE TABLE ro_f_bdt_magasin OF f_bdt_magasin(
	PRIMARY KEY(magasin),
	departement NOT NULL,
	nomDepartement NOT NULL,
	population NOT NULL,
	rayonnage NOT NULL,
	rayonnageExplicite NOT NULL,
	rayonBS NOT NULL,
	rayonRecent NOT NULL,
	CHECK (rayonnage IN ('Y', 'E', 'A')),
	CHECK (rayonnageExplicite IN ('Year', 'Editor', 'Author')),
	CHECK (rayonBS IN ('0', '1')),
	CHECK (rayonRecent IN ('0', '1'))
);