/* Clément Laporte - Justine Meuret - Alexis Feron  */

/* Remise à zéro */

DROP TABLE ACHETER;
DROP TABLE FOURNIR;
DROP TABLE PRODUIT;
DROP TABLE FOURNISSEUR;
DROP TABLE CLIENT;

/* Création des tables */

CREATE TABLE CLIENT(
	numClient	char(6)	PRIMARY KEY,
	nom 		varchar(20)	NOT NULL,
	prénom		varchar(20)	NOT NULL,
	rue		varchar(30)	NOT NULL,
	ville		varchar(30)	NOT NULL,
	codePostal	numeric(5),
	ventilation	varchar(7)	NOT NULL
);
CREATE TABLE FOURNISSEUR(
	numFourni	char(6)	PRIMARY KEY,
	nom 		varchar(20)	NOT NULL,
	ville		varchar(30)	NOT NULL
);
CREATE TABLE PRODUIT(
	numProd		char(6)	PRIMARY KEY,
	qte		numeric(8)	NOT NULL,
	nom		varchar(20)	NOT NULL,
	prix		numeric(8,2)	NOT NULL,
	poids		numeric(5,2),
	marque		varchar(20)
);
CREATE TABLE FOURNIR(
	numFourni	char(6),
	numProd		char(6),
	PRIMARY KEY(numFourni,numProd),
	FOREIGN KEY (numFourni) REFERENCES FOURNISSEUR(numFourni),
	FOREIGN KEY (numProd) REFERENCES PRODUIT(numProd)
);
CREATE TABLE ACHETER(
	qte		numeric(8)	NOT NULL,
	date		date,
	numClient	char(6),
	numProd		char(6),
	PRIMARY KEY(numClient,numProd),
	FOREIGN KEY (numClient) REFERENCES CLIENT(numClient),
	FOREIGN KEY (numProd) REFERENCES PRODUIT(numProd)
);
