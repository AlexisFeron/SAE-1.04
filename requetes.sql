/* Clément Laporte - Justine Meuret - Alexis Feron  */

/* Requêtes SQL */

/* 1 */ SELECT numProd produits_non_achetés FROM PRODUIT WHERE numProd NOT IN (SELECT numProd FROM ACHETER);

/* 2 */ SELECT count(*) produits_vendus_la_semaine_derniere, (SELECT count(*) produits_vendus_après_la_campagne FROM ACHETER WHERE date>current_date-7) FROM ACHETER WHERE ACHETER.date<current_date-7 AND ACHETER.date>current_date-14 ;

/* 3 */ SELECT numClient clients_qui_n_ont_pas_acheté FROM CLIENT WHERE numClient NOT IN (SELECT numClient FROM ACHETER);

/* 4 */  SELECT sum(prix*ACHETER.qte) total, CLIENT.ventilation FROM CLIENT, ACHETER, PRODUIT WHERE ACHETER.numClient=CLIENT.numClient AND ACHETER.numProd=PRODUIT.numProd AND ACHETER.date>CURRENT_DATE-31 GROUP BY CLIENT.ventilation; 
