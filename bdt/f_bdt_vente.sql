CREATE OR REPLACE TYPE f_bdt_vente AS OBJECT (
	ticket VARCHAR2(30),
	fKDateTicket VARCHAR2(20),
	fKProduit VARCHAR2(30),
	fKMagasin VARCHAR2(10),
	MEMBER FUNCTION getTicket RETURN NUMBER,
	MEMBER FUNCTION getDateTicket RETURN date,
	MEMBER FUNCTION getProduit RETURN NUMBER,
	MEMBER FUNCTION getMagasin RETURN VARCHAR2
);-- [NOT FINAL];
/

CREATE OR REPLACE TYPE BODY f_bdt_vente
IS 
	MEMBER FUNCTION getTicket RETURN NUMBER
	IS
	BEGIN
		IF LENGTH(ticket) = 9 THEN 
			RETURN TO_NUMBER(ticket);
		ELSE  
			RETURN NULL;
		END IF;
	END;

	MEMBER FUNCTION getDateTicket RETURN date
	IS
	regexResult NUMBER(1);
	BEGIN
		SELECT REGEXP_INSTR(fKDateTicket, '\d{4}-\d{2}-\d{2}') INTO regexResult FROM DUAL;
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
			RETURN TO_DATE(fKDateTicket, 'YYYY-MM-DD');
		END IF;    
	END;

	MEMBER FUNCTION getProduit RETURN NUMBER
	IS
	BEGIN
		IF LENGTH(fKProduit) = 13 THEN 
			RETURN TO_NUMBER(fKProduit);
		ELSE  
			RETURN NULL;
		END IF;  
	END;

	MEMBER FUNCTION getMagasin RETURN VARCHAR2
	IS
	BEGIN
		IF SUBSTR(fKMagasin, 1, 1) = 'M' THEN 
			RETURN fKMagasin;
		ELSE  
			RETURN NULL;
		END IF;  
	END;     
END;
/

CREATE TABLE ro_f_bdt_vente OF f_bdt_vente(
  FOREIGN KEY(fKDateTicket) REFERENCES ro_f_bdt_date(dateTicket)
);