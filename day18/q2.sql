/* -- | name | continent |
-- |--------|-----------|
-- | Jack | America |
-- | Pascal | Europe |
-- | Xi | Asia |
-- | Jane | America |


-- Pivot the continent column in this table so that each name is sorted alphabetically and displayed underneath its corresponding continent. The output headers should be America, Asia and Europe respectively. It is guaranteed that the student number from America is no less than either Asia or Europe.
 */
drop table earth;
CREATE TABLE earth (
    name1 VARCHAR2(255) NOT NULL,
    continent VARCHAR2(255) NOT NULL
);

INSERT INTO earth VALUES ('Jack', 'America');
INSERT INTO earth VALUES ('Pascal', 'Europe');
INSERT INTO earth VALUES ('Xi', 'Asia');
INSERT INTO earth VALUES ('Jane', 'America');



SELECT
  a.sname AS America
  ,b.sname AS Asia
  ,c.sname AS Europe
FROM
(SELECT ROW_NUMBER() OVER (ORDER BY sname) AS ID, sname FROM geography WHERE continent = 'America') a
FULL JOIN
(SELECT ROW_NUMBER() OVER (ORDER BY sname) AS ID, sname FROM geography WHERE continent = 'Asia') b
ON a.ID = b.ID
FULL JOIN
(SELECT ROW_NUMBER() OVER (ORDER BY sname) AS ID, sname FROM geography WHERE continent = 'Europe') c
ON c.ID = b.ID
OR c.ID = a.ID;

SELECT
  ama.name1 AS America
  ,asa.name1 AS Asia
  ,eur.name1 AS Europe
FROM
(SELECT ROW_NUMBER() OVER (ORDER BY name1) AS ID, name1 FROM earth WHERE continent = 'America') ama
FULL JOIN
(SELECT ROW_NUMBER() OVER (ORDER BY name1) AS ID, name1 FROM earth WHERE continent = 'Asia') asa
ON ama.ID = asa.ID
FULL JOIN
(SELECT ROW_NUMBER() OVER (ORDER BY name1) AS ID, name1 FROM earth WHERE continent = 'Europe') eur
ON eur.ID = asa.ID
OR eur.ID = ama.ID;



SELECT
  a.name1 AS America
  ,b.name1 AS Asia
  ,c.name1 AS Europe
FROM
(SELECT ROW_NUMBER() OVER (ORDER BY name1) AS ID, name1 FROM earth WHERE continent = 'America') a
FULL JOIN
(SELECT ROW_NUMBER() OVER (ORDER BY name1) AS ID, name1 FROM earth WHERE continent = 'Asia') b
ON a.ID = b.ID
FULL JOIN
(SELECT ROW_NUMBER() OVER (ORDER BY name1) AS ID, name1 FROM earth WHERE continent = 'Europe') c
ON c.ID = b.ID
OR c.ID = a.ID;
