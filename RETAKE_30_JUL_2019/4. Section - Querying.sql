# 5. Extract 3 biggest articles 
SELECT  
	r.title,
	concat(substring(r.content, 1, 20), '...') AS r_content 
 FROM (
	SELECT  *
	FROM articles AS a
	group by a.id
	ORDER BY char_length(a.content) DESC
	LIMIT 3
) as r
ORDER BY r.id;

# 6. Golden Articles
 SELECT 
	 a.id,
	 a.title
 FROM users_articles AS ua
 JOIN articles AS a ON ua.article_id = a.id
 WHERE ua.article_id = ua.user_id
 ORDER BY a.id ASC;

# 7. Extract categories
SELECT 
	c.category, 
	count(a.id) AS count_articles ,  
	count(l.id) AS count_likes
FROM categories AS c 
JOIN articles AS a ON c.id = a.category_id
JOIN likes AS l ON a.id = l.article_id 
GROUP BY c.id
ORDER BY count_likes DESC, count_articles DESC, c.id ASC;

# 8. Extract the most commented Social article
SELECT 
	a.title,
	count(c.id) AS comments_count 
FROM articles AS a 
JOIN comments AS c ON a.id = c.article_id
GROUP BY a.id
ORDER BY comments_count DESC
LIMIT 1;

# 9. Extract the less liked comments
SELECT 
	concat(substring(c.comment, 1, 20), '...') AS sub_comment
FROM comments AS c 
LEFT JOIN likes AS l ON c.id = l.comment_id
WHERE l.comment_id IS NULL
GROUP BY c.id
ORDER BY c.id DESC;
























