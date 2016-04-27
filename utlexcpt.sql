-- utlexcpt.sql
DROP TABLE exceptions;

CREATE TABLE exceptions(
	row_id rowid,
    owner VARCHAR2(30),
    table_name VARCHAR2(30),
	constraint VARCHAR2(30)
);
          
/*
	-- desactivation of constraints
	ALTER TABLE nom_table DISABLE CONSTRAINT nom_contrainte;            

	-- reactivation of constraints
	ALTER TABLE nom_table ENABLE CONSTRAINT nom_contrainte
	EXCEPTIONS INTO exceptions;

	SELECT constraint_name, table_name FROM user_constraints;
*/