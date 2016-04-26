-- utlexcpt.sql
DROP TABLE exceptions;

CREATE TABLE exceptions(
	row_id rowid,
    owner varchar2(30),
    table_name varchar2(30),
	constraint varchar2(30)
);
          
/*
	-- desactivation of constraints
	ALTER TABLE nom_table DISABLE CONSTRAINT nom_contrainte;            

	-- reactivation of constraints
	ALTER TABLE nom_table ENABLE CONSTRAINT nom_contrainte
	EXCEPTIONS INTO exceptions;

	SELECT constraint_name, table_name FROM user_constraints;
*/