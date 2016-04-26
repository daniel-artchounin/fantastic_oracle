-- utlexcpt.sql
create table exceptions(row_id rowid,
	                owner varchar2(30),
	                table_name varchar2(30),
		        constraint varchar2(30));
          
-- desactivation of constraints
ALTER TABLE nom_table DISABLE CONSTRAINT nom_contrainte;            

-- reactivation of constraints
ALTER TABLE nom_table ENABLE CONSTRAINT nom_contrainte

	EXCEPTIONS INTO exceptions ;

select constraint_name, table_name from user_constraints;