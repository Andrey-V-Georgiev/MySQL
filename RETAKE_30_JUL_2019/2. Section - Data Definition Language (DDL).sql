# DROP SCHEMA colonial_blog_db;

# CREATE SCHEMA colonial_blog_db;

# USE colonial_blog_db;

#users
CREATE TABLE `users` (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(30) NOT NULL UNIQUE,
    `password` VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL
);  

# categories
CREATE TABLE `categories` (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(30) NOT NULL  
);  

# articles
CREATE TABLE `articles` (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    category_id INTEGER,
    CONSTRAINT fk_category_id FOREIGN KEY (category_id)  REFERENCES categories(id)
); 

# users_articles
CREATE TABLE `users_articles` (
	user_id INTEGER ,
    article_id INTEGER,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id)  REFERENCES users(id),
    CONSTRAINT fk_article_id FOREIGN KEY (article_id)  REFERENCES articles(id)
);

# comments
CREATE TABLE `comments` (
	id INTEGER PRIMARY KEY AUTO_INCREMENT,
	`comment` VARCHAR(255) NOT NULL,
    article_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
	CONSTRAINT fk_comments_article_id FOREIGN KEY (article_id)  REFERENCES articles(id),
    CONSTRAINT fk_comments_user_id FOREIGN KEY (user_id)  REFERENCES users(id)
);

# likes
CREATE TABLE `likes` (
	id INTEGER PRIMARY KEY AUTO_INCREMENT, 
    article_id INTEGER,
    comment_id INTEGER,
    user_id INTEGER,
    
	CONSTRAINT fk_likes_article_id FOREIGN KEY (article_id)  REFERENCES articles(id),
	CONSTRAINT fk_likes_comment_id FOREIGN KEY (comment_id)  REFERENCES comments(id),
    CONSTRAINT fk_likes_user_id FOREIGN KEY (user_id)  REFERENCES users(id)
);



