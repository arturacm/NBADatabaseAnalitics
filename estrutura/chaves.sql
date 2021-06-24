-- Queries  para adicionar Chaves Primarias [pk] e chaves estrangeiras [fk]
-- Deve ser exercutada por ultimo, após as cargas das tabelas, trocas de "" por null e mudanças dos tipos de dados 
ALTER TABLE `Teams` 
CHANGE COLUMN `TEAM_ID` `TEAM_ID` INT NOT NULL ,
ADD PRIMARY KEY (`TEAM_ID`);

ALTER TABLE `Games` 
CHANGE COLUMN `GAME_ID` `GAME_ID` INT NOT NULL ,
ADD PRIMARY KEY (`GAME_ID`);

ALTER TABLE `Players` 
CHANGE COLUMN `PLAYER_ID` `PLAYER_ID` INT NOT NULL ,
ADD PRIMARY KEY (`PLAYER_ID`);
;

ALTER TABLE `Players_Teams` ADD FOREIGN KEY (`PLAYER_ID`) REFERENCES `Players` (`PLAYER_ID`);
ALTER TABLE `Players_Teams` ADD FOREIGN KEY (`TEAM_ID`) REFERENCES `Teams` (`TEAM_ID`);

ALTER TABLE `Games` ADD FOREIGN KEY (`HOME_TEAM_ID`) REFERENCES `Teams` (`TEAM_ID`);
ALTER TABLE `Games` ADD FOREIGN KEY (`VISITOR_TEAM_ID`) REFERENCES `Teams` (`TEAM_ID`);

ALTER TABLE `Ranking` ADD FOREIGN KEY (`TEAM_ID`) REFERENCES `Teams` (`TEAM_ID`);

ALTER TABLE `Games_details` ADD FOREIGN KEY (`TEAM_ID`) REFERENCES `Teams` (`TEAM_ID`);
ALTER TABLE `Games_details` ADD FOREIGN KEY (`GAME_ID`) REFERENCES `Games` (`GAME_ID`);