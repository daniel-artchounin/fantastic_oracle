CREATE TABLE fobs_dw_calls(
	fkCity VARCHAR2(5),
	fkCallDate DATE,
	fkCustomerNumber NUMBER(10),
	receiverNumber NUMBER(10),
	duration NUMBER(6)
);

ALTER TABLE fobs_dw_calls 
	ADD CONSTRAINT cstrFkCity FOREIGN KEY(fkCity) REFERENCES fobs_dw_ville(codeCommune)
	ADD CONSTRAINT cstrFkCallDate FOREIGN KEY(fkCallDate) REFERENCES fobs_dw_date(dateCall)
	ADD CONSTRAINT cstrFkCustomerNumber FOREIGN KEY(fkCustomerNumber) REFERENCES fobs_dw_appelant(customerNumber);