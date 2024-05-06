USE SocialMedia;

# Business Opportunity 1
-- Getting the top 10 most popular posts based on likes
SELECT * FROM Post ORDER BY likes DESC LIMIT 10; 

-- Getting the total number of likes from these posts
SELECT SUM(likes) as 'total likes' FROM(SELECT likes FROM Post ORDER BY likes DESC LIMIT 10) AS likecnt;

-- Getting the total friends of the users with the top 10 most popular posts
SELECT COUNT(friend_b_id) FROM Friendship WHERE friend_a_id IN(8,14,174,248,534,564,612,832,868,881);
SELECT COUNT(friend_a_id) FROM Friendship WHERE friend_b_id IN(8,14,174,248,534,564,612,832,868,881);

# Business Problem 2
-- Finding all the posts before the year 1994
SELECT id, creation_date FROM Post WHERE YEAR(creation_date) < 1994;

-- Counting the number of posts created before 1994
SELECT COUNT(id) as 'Total posts to remove' FROM Post WHERE YEAR(creation_date) < 1994; 

-- Statement to delete these posts
DELETE FROM Post WHERE YEAR(creation_date) < 1994; 

# Business Problem 3
-- Getting all bots users, assuming they are younger than 16 years or older than 70 years
SELECT id,DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),date_of_birth)),'%Y') as 'age' 
FROM User WHERE DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),date_of_birth)),'%Y') < 0016 
OR DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),date_of_birth)),'%Y') > 0070;

-- Getting the total count of bot accounts
SELECT COUNT(id) as 'Total number of bots' FROM User WHERE 
DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),date_of_birth)),'%Y') < 0016 
OR DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),date_of_birth)),'%Y') > 0070;

-- Statement to delete the bot accounts
DELETE FROM User WHERE 
DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),date_of_birth)),'%Y') < 0016 
OR DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),date_of_birth)),'%Y') > 0070;


