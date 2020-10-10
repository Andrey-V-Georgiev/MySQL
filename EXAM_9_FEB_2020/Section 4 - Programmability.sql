#10. Find all players that play on stadium
 
CREATE FUNCTION `udf_stadium_players_count`(stadium_name VARCHAR(30)) 
RETURNS int
BEGIN

RETURN 	(
    SELECT COUNT(`pl`.id) 
	FROM stadiums AS `sta` 
	LEFT JOIN teams AS `te` ON `sta`.id = `te`.stadium_id
	LEFT JOIN players AS `pl` ON `te`.id = `pl`.team_id 
	WHERE sta.name = stadium_name
	GROUP BY  `sta`.id
    LIMIT 1
    ); 
END

#SELECT udf_stadium_players_count ('Jaxworks') as `count`; 

#11. Find good playmaker by teams
CREATE PROCEDURE `udp_find_playmaker`(min_dribble_points INTEGER, team_name VARCHAR(45))
BEGIN
	SELECT 
		CONCAT(p.first_name, ' ', p.last_name) AS full_name,
        p.age,
        p.salary,
        sd.dribbling,
        sd.speed,
		t.name 
	FROM teams AS t
	JOIN players AS p ON t.id = p.team_id
	JOIN skills_data AS sd ON p.skills_data_id = sd.id
	WHERE t.name = team_name 
	AND sd.dribbling > min_dribble_points
	AND sd.speed > (select avg(speed) from skills_data)
	GROUP BY p.id
	ORDER BY sd.speed DESC
	LIMIT 1;
END

#CALL udp_find_playmaker (20, 'Skyble');











