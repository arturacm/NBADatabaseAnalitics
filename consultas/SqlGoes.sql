#5 jogadores que fizeram mais pontos

    SELECT 
    PLAYER_NAME, SUM(PTS) AS PontosFeitos
FROM
    Games_details
GROUP BY PLAYER_NAME
ORDER BY PontosFeitos DESC
LIMIT 5;

#------------
#Quantidades de times que foram fundados por ano
    SELECT 
    YEARFOUNDED , count(NICKNAME) AS timesFundados
FROM
    Teams
group by YEARFOUNDED    
order by YEARFOUNDED asc;

#-----------