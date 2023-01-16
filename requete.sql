--! Liste des hotels!--
SELECT hot_nom,hot_ville FROM `hotel` ;
-- Résidence Mr White--
SELECT cli_nom,cli_prenom,cli_adresse   FROM `client` WHERE cli_nom = 'WHITE'
-- station <1000--
SELECT sta_nom FROM `station` WHERE sta_altitude  <1000
--capicité chambre--
SELECT cha_numero,cha_capacite FROM `chambre` WHERE 1
--les clients n'habitant pas à Londres--
SELECT cli_nom,cli_prenom FROM `client` WHERE cli_ville != "Londres"
-- Afficher la liste des hotels située sur la ville de Bretou et possédant une catégorie >3
SELECT hot_nom, hot_ville, hot_categorie FROM `hotel` WHERE hot_categorie>3

--EX 7--
SELECT hot_nom, hot_categorie,  hot_ville, hot_sta_id FROM `hotel` 
--EX 8--
SELECT hot_nom, hot_categorie, hot_ville, cha_numero FROM hotel JOIN chambre 
--EX 9--
SELECT hot_nom, hot_categorie, hot_ville, cha_numero, cha_capacite FROM hotel JOIN chambre WHERE hot_ville = 'Bretou'
--EX 10--
SELECT cli_nom, hot_nom, res_date FROM `client`JOIN hotel JOIN reservation 
--EX 11--
SELECT sta_nom, hot_nom, cha_numero, cha_capacite FROM station JOIN hotel JOIN chambre
--EX 12--
SELECT cli_nom, hot_nom, res_date_debut, DATEDIFF(res_date_fin, res_date_debut) FROM reservation JOIN hotel Join chambre
--EX 13--
SELECT COUNT(hot_nom), sta_nom FROM `station` JOIN hotel group by sta_nom 
--EX 14--
SELECT COUNT(cha_id), sta_id FROM chambre JOIN hotel JOIN station GROUP BY sta_nom
--EX 15--
SELECT COUNT(cha_id), sta_id FROM chambre JOIN hotel JOIN station WHERE chambre.cha_capacite > 1  GROUP BY sta_nom
--EX 16--
SELECT hot_nom FROM hotel JOIN chambre JOIN reservation JOIN client WHERE cli_nom = 'Squire'
--EX 17--
SELECT AVG(DATEDIFF(res_date_fin, res_date_debut)) AS 'Durée moyenne', sta_nom AS 'nom de la station' 
FROM reservation JOIN chambre JOIN hotel JOIN station GROUP BY sta_nom;