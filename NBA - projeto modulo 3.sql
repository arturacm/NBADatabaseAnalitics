CREATE TABLE `games_details` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `email` varchar(250),
  `username` varchar(20),
  `senha` varchar(20)
);
CREATE TABLE IF NOT EXISTS `games_details` (
`GAME_ID` INT,
`TEAM_ID` INT,
`TEAM_ABBREVIATION` CHAR(3),
`TEAM_CITY` VARCHAR(20),
`PLAYER_ID` INT,
`PLAYER_NAME` VARCHAR(25),
`START_POSITION` char(1),
`COMMENT` VARCHAR(25),
`MIN` VARCHAR(5),
#continuo aqui dpois
`FGM` VARCHAR(MAX),
`FGA` VARCHAR(MAX),
`FG_PCT` VARCHAR(MAX),
`FG3M` VARCHAR(MAX),
`FG3A` VARCHAR(MAX),
`FG3_PCT` VARCHAR(MAX),
`FTM` VARCHAR(MAX),
`FTA` VARCHAR(MAX),
`FT_PCT` VARCHAR(MAX),
`OREB` VARCHAR(MAX),
`DREB` VARCHAR(MAX),
`REB` VARCHAR(MAX),
`AST` VARCHAR(MAX),
`STL` VARCHAR(MAX),
`BLK` VARCHAR(MAX),
`TO` VARCHAR(MAX),
`PF` VARCHAR(MAX),
`PTS` VARCHAR(MAX),
`PLUS_MINUS` VARCHAR(MAX)
);
CREATE TABLE `games` (
  `game_date_est` date,
  `game_id` int,
  `game_status_text` varchar(20),
  `home_team_id` int,
  `visitor_team_id` int,
  `season` int,
  `TEAM_ID_home` int,
  `PTS_home` int,
  `FG_PCT_home` float,
  `FT_PCT_home` float,
  `FG3_PCT_home` float,
  `AST_home` int,
  `REB_home` int,
  `TEAM_ID_away` int,
  `PTS_away` int,
  `FG_PCT_away` float,
  `FT_PCT_away` float,
  `FG3_PCT_away` float,
  `AST_away` int,
  `REB_away` int,
  `HOME_TEAM_WINS` boolean
);

CREATE TABLE `players` (
  `PLAYER_NAME` varchar(250),
  `TEAM_ID` int,
  `PLAYER_ID` int PRIMARY KEY,
  `SEASON` char(4)
);

CREATE TABLE `ranking` (
  `TEAM_ID` int,
  `LEAGUE_ID` int,
  `SEASON_ID` int,
  `STANDINGSDATE` char(10),
  `CONFERENCE` char(4),
  `TEAM` varchar(25),
  `G` int,
  `W` int,
  `L` int,
  `W_PCT` float,
  `HOME_RECORD` varchar(6),
  `ROAD_RECORD` varchar(6)
);

CREATE TABLE `teams` (
  `LEAGUE_ID` int,
  `TEAM_ID` int PRIMARY KEY,
  `MIN_YEAR` char(4),
  `MAX_YEAR` char(4),
  `ABBREVIATION` char(3),
  `NICKNAME` varchar(20),
  `YEARFOUNDED` char(4),
  `CITY` varchar(20),
  `ARENA` varchar(20),
  `ARENACAPACITY` int,
  `OWNER` varchar(25),
  `GENERALMANAGER` varchar(25),
  `HEADCOACH` varchar(25),
  `DLEAGUEAFFILIATION` varchar(25)
);

ALTER TABLE `games` ADD FOREIGN KEY (`home_team_id`) REFERENCES `teams` (`TEAM_ID`);

ALTER TABLE `games` ADD FOREIGN KEY (`visitor_team_id`) REFERENCES `teams` (`TEAM_ID`);

ALTER TABLE `games` ADD FOREIGN KEY (`TEAM_ID_home`) REFERENCES `teams` (`TEAM_ID`);

ALTER TABLE `games` ADD FOREIGN KEY (`TEAM_ID_away`) REFERENCES `teams` (`TEAM_ID`);

ALTER TABLE `players` ADD FOREIGN KEY (`TEAM_ID`) REFERENCES `teams` (`TEAM_ID`);

ALTER TABLE `ranking` ADD FOREIGN KEY (`TEAM_ID`) REFERENCES `teams` (`TEAM_ID`);
