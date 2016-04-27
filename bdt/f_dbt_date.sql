CREATE OR REPLACE TYPE f_bdt_date AS OBJECT (
	dateTicket VARCHAR(20),
	MEMBER FUNCTION getDate RETURN date,
	MEMBER FUNCTION getJDS RETURN NUMBER,
	MEMBER FUNCTION getJDA RETURN NUMBER,
	MEMBER FUNCTION getMois RETURN NUMBER,
	MEMBER FUNCTION getTrimestre RETURN NUMBER,
	MEMBER FUNCTION getSemaine RETURN NUMBER
);-- [NOT FINAL];
/

CREATE OR REPLACE TYPE BODY f_bdt_date
IS 
	MEMBER FUNCTION getDate RETURN date
	IS
	regexResult NUMBER(1);
	BEGIN
		regexResult := REGEXP_INSTR(SELF.dateTicket, '\d{4}-\d{2}-\d{2}');
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
			RETURN TO_DATE(SELF.dateTicket, 'YYYY-MM-DD');
		END IF;
	END;

	MEMBER FUNCTION getJDS RETURN NUMBER
	IS
		regexResult NUMBER(1);
		dayWeek NUMBER(1);
	BEGIN
		regexResult := REGEXP_INSTR(SELF.dateTicket, '\d{4}-\d{2}-\d{2}');
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
			dayWeek := TO_CHAR(TO_DATE(SELF.dateTicket, 'YYYY-MM-DD'), 'D');
			RETURN TO_NUMBER(dayWeek);
		END IF;
	END;

	MEMBER FUNCTION getJDA RETURN NUMBER
	IS
		regexResult NUMBER(1);
	BEGIN
		regexResult := REGEXP_INSTR(SELF.dateTicket, '\d{4}-\d{2}-\d{2}');
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
			RETURN TO_NUMBER(TO_CHAR(TO_DATE(SELF.dateTicket, 'YYYY-MM-DD'), 'DDD'));
		END IF;
	END;

	MEMBER FUNCTION getMois RETURN NUMBER
	IS
		regexResult NUMBER(1);
	BEGIN
		regexResult := REGEXP_INSTR(SELF.dateTicket, '\d{4}-\d{2}-\d{2}');
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
			RETURN TO_NUMBER(TO_CHAR(TO_DATE(SELF.dateTicket, 'YYYY-MM-DD'), 'MM'));
		END IF;
	END;

	MEMBER FUNCTION getTrimestre RETURN NUMBER
	IS
		regexResult NUMBER(1);
		monthOfYear NUMBER(2);
	BEGIN
		regexResult := REGEXP_INSTR(SELF.dateTicket, '\d{4}-\d{2}-\d{2}');
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
			monthOfYear := TO_NUMBER(TO_CHAR(TO_DATE(SELF.dateTicket, 'YYYY-MM-DD'), 'MM'));
			IF  monthOfYear <= 3 THEN 
				RETURN TO_NUMBER('1');
			ELSIF monthOfYear <= 6 THEN 
				RETURN TO_NUMBER('2');
			ELSIF monthOfYear <= 9 THEN 
				RETURN TO_NUMBER('3');
			ELSE 
				RETURN TO_NUMBER('4');
			END IF;
		END IF;
	END;

	MEMBER FUNCTION getSemaine RETURN NUMBER
	IS
		regexResult NUMBER(1);
	BEGIN
		regexResult := REGEXP_INSTR(SELF.dateTicket, '\d{4}-\d{2}-\d{2}');
		IF regexResult = 0 THEN 
			RETURN NULL;
		ELSE
			RETURN TO_NUMBER(TO_CHAR(TO_DATE(SELF.dateTicket, 'YYYY-MM-DD'), 'IW'));
		END IF;
	END; 
END;
/

CREATE TABLE ro_f_bdt_date OF f_bdt_date(
  PRIMARY KEY(dateTicket)
);