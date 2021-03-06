CREATE OR REPLACE TYPE f_bdt_catalogue AS OBJECT (
	iSBN VARCHAR2(30),
	auteur VARCHAR2(200),
	titre VARCHAR2(100),
	langue VARCHAR2(5),
	publication VARCHAR2(50),
	MEMBER FUNCTION getISBN RETURN NUMBER,
	MEMBER FUNCTION getAuteurNom RETURN VARCHAR2,
	MEMBER FUNCTION getAuteurPrenom RETURN VARCHAR2,
	MEMBER FUNCTION getTitre RETURN VARCHAR2,
	MEMBER FUNCTION getLangue RETURN VARCHAR2,
	MEMBER FUNCTION getPublication RETURN date
);-- [NOT FINAL];
/

CREATE OR REPLACE TYPE BODY f_bdt_catalogue
IS 
	MEMBER FUNCTION getISBN RETURN NUMBER
	IS
	BEGIN
		IF LENGTH(SELF.iSBN) = 13 THEN 
	  		RETURN TO_NUMBER(SELF.iSBN);
		ELSE  
	 		RETURN NULL;
		END IF;    
	END;

	MEMBER FUNCTION getAuteurNom RETURN VARCHAR2
	IS
	auteurNom VARCHAR(30);
	BEGIN
		auteurNom := TRIM(REGEXP_SUBSTR(SELF.auteur, '[^,]+', 1, 1));
		IF auteurNom = '' THEN 
			RETURN NULL;
		ELSE
			RETURN auteurNom;
		END IF;
	END;

	MEMBER FUNCTION getAuteurPrenom RETURN VARCHAR2
	IS
	auteurPrenom VARCHAR(30);
	BEGIN
		auteurPrenom := TRIM(REGEXP_SUBSTR(SELF.auteur, '[^,]+', 1, 2));
		IF auteurPrenom = '' THEN 
	 		RETURN NULL;
		ELSE
			RETURN auteurPrenom;
		END IF;
	END;

	MEMBER FUNCTION getTitre RETURN VARCHAR2
	IS
	BEGIN
		IF SELF.titre = 'pas de titre' THEN 
	 		RETURN NULL;
		ELSE
			RETURN SELF.titre;
		END IF;    
	END;

	MEMBER FUNCTION getLangue RETURN VARCHAR2
	IS
	BEGIN
		IF LENGTH(SELF.langue) = 3 THEN 
			RETURN SELF.langue;
		ELSE
			RETURN NULL;
		END IF;      
	END;

	MEMBER FUNCTION getPublication RETURN date
	IS
		publicationVarchar VARCHAR2(30);
		publicationDate VARCHAR(30);
	BEGIN
		publicationVarchar := SUBSTR(SELF.publication, 1, 10);
		publicationDate := TO_DATE(publicationVarchar, 'YYYY-MM-DD');
		RETURN publicationDate;
	END;  
END;
/

CREATE TABLE ro_f_bdt_catalogue OF f_bdt_catalogue(
  PRIMARY KEY (iSBN),
  auteur NOT NULL,
  titre NOT NULL,
  publication NOT NULL
);