#jogadores que fizeram mais de 25 pontos em menos de 10 minutos jogando

SELECT  
PLAYER_NAME, PTS 
FROM
Games_details 
where
MIN < 10 && PTS > 25

------------------------------------------------

# Os 5 jogadores mais defensivos da liga

SELECT
PLAYER_NAME AS Jogadores , SUM(BLK) AS Bloqueios
FROM
Games_details
GROUP BY PLAYER_NAME
ORDER BY Bloqueios desc
limit 5;
