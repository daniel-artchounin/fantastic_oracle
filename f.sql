spool log.txt
	@utlxplan.sql
	@manage_constraints.sql
	@./bde/f_bde.sql
	@./bdt/f_bdt.sql
	-- @./bdl/f_bdl.sql
spool off;