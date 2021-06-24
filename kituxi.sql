#os piores times da temporada de 2015

SELECT  
 distinct TEAM , L , W , SEASON_ID
FROM
Ranking
where	
L > 15 && W = 0 && SEASON_ID = 22015
limit 1;
