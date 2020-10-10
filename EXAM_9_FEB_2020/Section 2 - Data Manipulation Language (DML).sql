 # 02 INSERT
 INSERT INTO coaches (first_name, last_name, salary, coach_level )
 (
	SELECT 
		p.first_name, 
		p.last_name, 
		(p.salary * 2),
		CHAR_LENGTH(p.first_name)
    FROM players AS p
    WHERE p.age >= 45
 );
 
# 03 UPDATE
UPDATE coaches AS c
INNER JOIN players_coaches AS pc ON c.id = pc.coach_id
INNER JOIN players AS p ON pc.player_id = p.id 
SET c.coach_level = (c.coach_level + 1)
WHERE (SELECT COUNT(p.id)) >= 1
AND LEFT(c.first_name, 1) = 'A';
 
# 04 DELETE
DELETE
FROM players AS p
WHERE p.age >= 45;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 