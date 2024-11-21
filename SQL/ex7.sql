USE videogamereccomender;

-- View 1: HighRatedGames
CREATE OR REPLACE VIEW HighRatedGames AS
SELECT 
    r.rating_id, 
    r.user_id, 
    u.username, 
    v.title AS game_title, 
    r.score
FROM Rating r
JOIN User u ON r.user_id = u.user_id
JOIN VideoGame v ON r.game_id = v.game_id
WHERE r.score >= 4;

-- Query the HighRatedGames View
SELECT * FROM HighRatedGames WHERE score = 5;

-- View 2: UserActivitySummary
CREATE OR REPLACE VIEW UserActivitySummary AS
SELECT 
    u.user_id,
    u.username,
    COUNT(r.rating_id) AS games_rated,
    AVG(r.score) AS avg_rating
FROM User u
LEFT JOIN Rating r ON u.user_id = r.user_id
GROUP BY u.user_id, u.username;

-- Query the UserActivitySummary View
SELECT * FROM UserActivitySummary WHERE games_rated > 0 ORDER BY avg_rating DESC;
