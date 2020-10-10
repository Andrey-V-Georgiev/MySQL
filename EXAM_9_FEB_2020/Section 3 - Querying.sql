#05. Players
SELECT 
	p.first_name, 
	p.age, 
	p.salary 
FROM players AS p
ORDER BY p.salary DESC;
 
#06. Young offense players without contract
SELECT 
	p.id,
    CONCAT(p.first_name, ' ', p.last_name) AS full_name,
    p.age,
    p.position,
    p.hire_date
 FROM players AS p
 INNER JOIN skills_data AS sd ON p.skills_data_id = sd.id 
 WHERE p.position = 'A'  
 AND p.hire_date IS NULL
 AND sd.strength > 50
 ORDER BY p.salary ASC, p.age ASC;
 
#07. Detail info for all teams
SELECT
	t.name,
	t.established,
	t.fan_base,
	COUNT(p.id) AS count_of_players
FROM teams AS t
LEFT JOIN players AS p ON t.id = p.team_id
GROUP BY t.id
ORDER BY count_of_players DESC, t.fan_base DESC;
 
#08. The fastest player by towns
-- SELECT 
-- 	`skills`.speed,
--     `town`.name AS town_name,
--      `stadium`.name AS stadium_name,
--     `team`.name AS team_name,
--      CONCAT(`player`.first_name, ' ', `player`.last_name) AS player_name
--      
-- FROM towns AS `town`   
-- left JOIN stadiums AS `stadium` ON `town`.id = `stadium`.town_id
-- left JOIN teams AS `team` ON `stadium`.id = `team`.stadium_id
-- left JOIN players AS `player` ON `team`.id = `player`.team_id
-- left JOIN skills_data AS `skills` ON `player`.skills_data_id = `skills`.id
--  
-- WHERE `team`.name <> 'Devify'
-- GROUP BY `skills`.speed,`town`.name
-- ORDER BY `skills`.speed DESC, `town`.name ASC;
 
 
#09. Total salaries and players by country
SELECT   
	`co`.`name`,
	COUNT(`pl`.id) AS total_count_of_players,
	SUM(`pl`.salary) AS total_sum_of_salasries
FROM 
	countries AS `co`
	LEFT join towns AS `to` on co.id = to.country_id  
	LEFT JOIN stadiums AS `sta` ON `to`.id = `sta`.town_id
	LEFT JOIN teams AS `te` ON `sta`.id = `te`.stadium_id
	LEFT JOIN players AS `pl` ON `te`.id = `pl`.team_id 
GROUP BY  `co`.id
ORDER BY total_count_of_players DESC, `co`.`name`; 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 