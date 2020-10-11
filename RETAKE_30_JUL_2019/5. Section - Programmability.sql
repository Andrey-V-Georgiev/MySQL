# 10. Get user’s articles count
CREATE  FUNCTION `udf_users_articles_count`(username VARCHAR(30)) RETURNS int
BEGIN
RETURN 	   (SELECT 
		count(a.id) AS count_articles
		FROM articles AS a
		JOIN users_articles AS ua ON a.id = ua.article_id
        JOIN users As u ON ua.user_id = u.id
		WHERE u.username = username
		GROUP BY u.id
        ORDER BY count_articles DESC
        LIMIT 1); 
END

-- SELECT u.username, udf_users_articles_count('UnderSinduxrein') AS count
-- FROM articles AS a
-- JOIN users_articles ua
-- ON a.id = ua.article_id
-- JOIN users u
-- ON ua.user_id = u.id
-- WHERE u.username = 'UnderSinduxrein'
-- GROUP BY u.id;

# 11. Like article
CREATE PROCEDURE `udp_like_article`(username VARCHAR(30), title VARCHAR(30))
BEGIN
  START TRANSACTION;
	IF ((SELECT u.id FROM users AS u  WHERE u.username = username  LIMIT 1) IS NULL) 
		THEN   ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non-existent user.';
    END IF;
	IF ((SELECT a.id  FROM articles AS a  WHERE a.title = title  LIMIT 1) IS NULL) 
		THEN   ROLLBACK;
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Non-existent article.';
    END IF;
    INSERT INTO likes (article_id, user_id)
    (
		SELECT a.id, u.id
		FROM users AS u, articles AS a
		WHERE u.username = username AND a.title = title
    );
END

-- CALL udp_like_article('Pesho123', 'Donnybrook, Victoria');
-- CALL udp_like_article('BlaAntigadsa', 'Na Pesho statiqta');

-- CALL udp_like_article('BlaAntigadsa', 'Donnybrook, Victoria');
-- SELECT a.title, u.username 
-- FROM articles a 
-- JOIN likes l
-- ON a.id = l.article_id
-- JOIN users u
-- ON l.user_id = u.id
-- WHERE u.username = 'BlaAntigadsa' AND a.title = 'Donnybrook, Victoria';

