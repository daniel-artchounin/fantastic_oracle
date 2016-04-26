CREATE TABLE f_dw_date(
	dateTicket date,
	jDS NUMBER(1),
	jDA NUMBER(3),
	mois NUMBER(2),
	trimestre NUMBER(1),
	semaine NUMBER(2)
);

CREATE UNIQUE INDEX idxDateTicket
	ON f_dw_date(dateTicket);
ALTER TABLE f_dw_date 
	ADD CONSTRAINT cstrDateTicket PRIMARY KEY (dateTicket);