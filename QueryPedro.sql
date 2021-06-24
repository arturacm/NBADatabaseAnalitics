#Jogadores com maiores convertidas e tentativas de todas temporadas!

SELECT
PLAYER_NAME AS Jogadores , SUM(FGA) AS Tentativas , SUM(FGM) AS Convertidas 
FROM
Games_details
GROUP BY PLAYER_NAME
ORDER BY Convertidas DESC
LIMIT 5;

-------------------------------------------------------------


#Jogadores com maiores convertidas e tentativas de todas temporadas!

SELECT
PLAYER_NAME AS Jogadores , SUM(FGA) AS Tentativas , SUM(FGM) AS Convertidas 
FROM
Games_details
GROUP BY PLAYER_NAME
ORDER BY Convertidas DESC
LIMIT 5;
