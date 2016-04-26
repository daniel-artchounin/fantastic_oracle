CREATE OR REPLACE PROCEDURE manage_constraints (i_status IN varchar2, tab_n IN varchar2)
IS
	CURSOR ref_cons
	IS
		SELECT constraint_name, table_name, status
		FROM user_constraints
		WHERE constraint_type in ('C', 'R', 'P', 'U') AND table_name=upper(tab_n); -- You can disable more constraints type 
	v_status VARCHAR2 (10);
	v_sql VARCHAR2 (300);
BEGIN
	FOR e_cons IN ref_cons
	LOOP
		IF i_status = 'ENABLE' THEN
			v_sql :=
			    'ALTER TABLE '
			 || upper(e_cons.table_name)
			 || ' '
			 || i_status
			 || ' CONSTRAINT '
			 || e_cons.constraint_name
			 || ' EXCEPTIONS INTO exceptions';
		ELSE
			v_sql :=
			    'ALTER TABLE '
			 || upper(e_cons.table_name)
			 || ' '
			 || i_status
			 || ' CONSTRAINT '
			 || e_cons.constraint_name;
		END IF;	
		-- DBMS_OUTPUT.put_line (v_sql);
		EXECUTE IMMEDIATE v_sql;
	END LOOP;
EXCEPTION
	WHEN OTHERS
	THEN
	  RAISE;
END;
/

/*
ALTER TABLE RO_F_BDT_VENTE ENABLE CONSTRAINT SYS_C00399249;
SELECT *
FROM user_constraints
WHERE constraint_name='SYS_C00399706';
*/

CREATE OR REPLACE PROCEDURE dropIndex (i_index IN varchar2)
IS
	v_sql VARCHAR2 (300);
BEGIN
	v_sql :=
	    'DROP INDEX '
	 || i_index;
	DBMS_OUTPUT.put_line (v_sql);
	EXECUTE IMMEDIATE v_sql;
EXCEPTION
	WHEN OTHERS
	THEN
		RAISE;
END;
/

CREATE OR REPLACE PROCEDURE createIndex (i_index IN varchar2, tab IN varchar2, a_attr IN varchar2)
IS
	v_sql VARCHAR2 (300);
BEGIN
	v_sql   :=
	    'CREATE UNIQUE INDEX '
	 || i_index
	 || ' ON '
	 || tab
	 || '('
	 || a_attr
	 || ')'
	 ;
	DBMS_OUTPUT.put_line (v_sql);
	EXECUTE IMMEDIATE v_sql;
EXCEPTION
	WHEN OTHERS
	THEN
		RAISE;
END;
/