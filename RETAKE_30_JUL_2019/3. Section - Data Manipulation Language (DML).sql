# INSERT
INSERT INTO likes ( article_id, comment_id, user_id)
(
	SELECT   
		CASE WHEN (u.id % 2 = 0) THEN CHAR_LENGTH(u.username) END,
		CASE WHEN (u.id % 2 <> 0) THEN CHAR_LENGTH(u.email) END,
        u.id
	FROM users AS u
	WHERE u.id BETWEEN 16 AND 20
);

# UPDATE
UPDATE `comments` AS c
SET c.comment = (CASE
	WHEN c.id % 2 = 0 THEN 'Very good article.'
	WHEN c.id % 3 = 0 THEN 'This is interesting.'
	WHEN c.id % 5 = 0 THEN 'I definitely will read the article again.'
	WHEN c.id % 7 = 0 THEN 'The universe is such an amazing thing.'
	ELSE c.comment
END)
WHERE c.id BETWEEN 1 AND 15;

# DELETE
DELETE FROM articles
WHERE category_id IS NULL;



