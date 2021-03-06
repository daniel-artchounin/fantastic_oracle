CREATE TABLE f_bde_departements(
	numDepartement NUMBER(3),
	nomDepartement VARCHAR2(30),
	population NUMBER(10)
)
ORGANIZATION EXTERNAL(
	TYPE ORACLE_LOADER
	DEFAULT DIRECTORY monRepertoireFSrc18
	ACCESS PARAMETERS(
		RECORDS DELIMITED BY newline
		SKIP 0
		CHARACTERSET UTF8
		BADFILE monRepertoireFLog18:'departements.txt.bad'
		LOGFILE monRepertoireFLog18:'departements.txt.log'
		FIELDS TERMINATED BY ';'
		OPTIONALLY ENCLOSED BY '"'
	)
	LOCATION ('departementsInsee2003.txt')
)
REJECT LIMIT 10;

-- DESCRIBE f_bde_departementsInsee2003;
-- SELECT TABLE_NAME, TYPE_NAME, DEFAULT_DIRECTORY_NAME FROM USER_EXTERNAL_TABLES;
