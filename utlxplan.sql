DROP TABLE PLAN_TABLE;

create table PLAN_TABLE(
	statement_id VARCHAR2(30),
	timestamp DATE,
	remarks VARCHAR2(80),
	operation VARCHAR2(30),
	options VARCHAR2(255),
	object_node VARCHAR2(128),
	object_owner VARCHAR2(30),
	object_name VARCHAR2(30),
	object_instance NUMERIC,
	object_type VARCHAR2(30),
	optimizer VARCHAR2(255),
	search_columns NUMBER,
	id NUMERIC,
	parent_id NUMERIC,
	position NUMERIC,
	cost NUMERIC,
	cardinality NUMERIC,
	bytes NUMERIC,
	other_tag VARCHAR2(255),
	partition_start VARCHAR2(255),
	partition_stop VARCHAR2(255),
	partition_id NUMERIC,
	other LONG,
	distribution VARCHAR2(30),
	cpu_cost NUMERIC,
	io_cost NUMERIC,
	temp_space NUMERIC,
	access_predicates VARCHAR2(4000),
	filter_predicates VARCHAR2(4000)
);

-- SET AUTOTRACE ON
-- ALTER SESSION SET OPTIMIZER_MODE="all_rows";