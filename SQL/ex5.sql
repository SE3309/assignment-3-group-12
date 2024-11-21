USE videogamereccomender;
SELECT username, age 
FROM User
WHERE age > 25;

SELECT vg.title AS GameTitle, g.genre_name AS Genre
FROM VideoGame vg
JOIN Genre g ON vg.genre_id = g.genre_id;

SELECT vg.title AS GameTitle, AVG(r.score) AS AverageRating
FROM VideoGame vg
LEFT JOIN Rating r ON vg.game_id = r.game_id
GROUP BY vg.title
ORDER BY AverageRating DESC;

SELECT u.username, r.score, r.review
FROM User u
JOIN Rating r ON u.user_id = r.user_id
WHERE r.score > 3;


SELECT s.name AS StudioName, vg.title AS GameTitle
FROM Studio s
JOIN VideoGame vg ON s.studio_id = vg.studio_id
WHERE s.head_location = 'Silvaton';

SELECT vg.title AS GameTitle, AVG(r.score) AS AverageRating, COUNT(r.rating_id) AS TotalReviews
FROM VideoGame vg
JOIN Rating r ON vg.game_id = r.game_id
GROUP BY vg.title
ORDER BY AverageRating DESC, TotalReviews DESC
LIMIT 5;

SELECT vg.title AS GameTitle, u.username
FROM VideoGame vg
JOIN Rating r ON vg.game_id = r.game_id
JOIN User u ON r.user_id = u.user_id
WHERE vg.title = 'Call of Duty' AND u.registration_date < '2022-01-01';



