#SELECT * FROM Teams;
#SELECT * FROM Games;
#select * from games_details;
#select * from ranking;
#SELECT * FROM players 
SELECT 
    PLAYER_NAME, NICKNAME, CITY, SEASON
FROM
    players
inner join Teams
on Teams.TEAM_ID  = players.TEAM_ID
;

# Trajetoria Stephen Curry nos times da NBA
SELECT 
    PLAYER_NAME, NICKNAME, CITY, SEASON
FROM
    players
        INNER JOIN
    Teams ON Teams.TEAM_ID = players.TEAM_ID
WHERE
    PLAYER_NAME LIKE 'Stephen Curry'
ORDER BY PLAYER_NAME , SEASON
;
# Trajetoria Lebrown James nos times da NBA
SELECT 
    PLAYER_NAME, NICKNAME, CITY, SEASON
FROM
    players
        INNER JOIN
    Teams ON Teams.TEAM_ID = players.TEAM_ID
WHERE
    PLAYER_NAME LIKE 'LeBron James'
ORDER BY PLAYER_NAME , SEASON
;
#Jogos da final com os nomes dos times com o vencedor
SELECT 
    GAME_DATE_EST, casa.NICKNAME as Time_Casa, visitante.NICKNAME as Time_Visitante,
    case
		when HOME_TEAM_WINS = 1 then casa.NICKNAME
        else visitante.NICKNAME
	end as Time_Vencedor
FROM
    Games
inner join
	Teams as visitante
on 
	Games.VISITOR_TEAM_ID = visitante.TEAM_ID
inner join
	Teams as casa
on 
	Games.HOME_TEAM_ID = casa.TEAM_ID
;

#jogadores que fizeram mais pontos de 3 nos ultimos 10 anos
SELECT 
    PLAYER_ID, PLAYER_NAME, SUM(FG3A) AS Feitos3pts
FROM
    games_details
GROUP BY PLAYER_ID , PLAYER_NAME
ORDER BY Feitos3pts DESC
LIMIT 10;
#----------------------
select * from games_details;

#jogadores que fizeram mais pontos de por temporada nos ultimos 10 anos
#https://stackoverflow.com/questions/7745609/sql-select-only-rows-with-max-value-on-a-column
SELECT 
    x.SEASON, PLAYER_NAME, x.max AS Pontos
FROM
    (SELECT 
        SEASON, MAX(Feitos3pts) AS max
    FROM
        (SELECT 
        PLAYER_ID, PLAYER_NAME, SEASON, SUM(FG3A) AS Feitos3pts
    FROM
        games_details
    INNER JOIN Games ON Games.GAME_ID = games_details.GAME_ID
    GROUP BY SEASON , PLAYER_ID , PLAYER_NAME
    ORDER BY Feitos3pts DESC , SEASON) AS season
    GROUP BY SEASON) AS x
        LEFT JOIN
    (SELECT 
        SEASON, MAX(Feitos3pts) AS max, PLAYER_NAME, PLAYER_ID
    FROM
        (SELECT 
        PLAYER_ID, PLAYER_NAME, SEASON, SUM(FG3A) AS Feitos3pts
    FROM
        games_details
    INNER JOIN Games ON Games.GAME_ID = games_details.GAME_ID
    GROUP BY SEASON , PLAYER_ID , PLAYER_NAME
    ORDER BY Feitos3pts DESC , SEASON) AS season
    GROUP BY SEASON , PLAYER_NAME , PLAYER_ID) AS y ON x.max = y.max AND x.season = y.season
ORDER BY x.SEASON DESC
LIMIT 10
;
