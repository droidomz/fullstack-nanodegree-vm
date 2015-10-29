-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


CREATE TABLE players(
   player_id serial PRIMARY KEY,
   player_name text
);




CREATE TABLE match(
   match_id serial PRIMARY KEY,
   winner INT,
   loser INT,
   FOREIGN KEY (winner) REFERENCES players(player_id),
   FOREIGN KEY (loser) REFERENCES players(player_id)
);


CREATE VIEW standings AS
SELECT player_id,
       player_name,
       (SELECT count(*) FROM match WHERE player_id = winner) AS wins,
       (SELECT count(*) FROM match WHERE player_id IN (winner, loser)) AS matches
FROM players
GROUP BY player_id;

