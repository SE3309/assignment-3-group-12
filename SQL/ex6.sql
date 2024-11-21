-- ex6.sql

-- 1. Complex INSERT Command
INSERT INTO VideoGame (game_id, title, genre_id, release_date, platform, studio_id, publisher)
VALUES (1001, 'Mystery Adventure', 2, '2024-11-15', 'PC', 3, 'Mystery Publisher');

INSERT INTO Rating (rating_id, user_id, game_id, review, rating_date)
VALUES 
    (3210, 1, 1001, 'Amazing story with unexpected twists!', '2024-11-16'),
    (3211, 2, 1001, 'Engaging but could have better graphics.', '2024-11-17'),
    (3212, 3, 1001, 'Good game but lacks multiplayer mode.', '2024-11-18');
    
SELECT * FROM Rating WHERE game_id = 1001;

-- 2. Complex UPDATE Command
UPDATE User u JOIN Wishlist w ON u.user_id = w.user_id
SET 
    u.username = 'updatedUser123',
    u.age = 25,
    w.comments = 'User prefers games with more challenging levels.'
WHERE 
    u.user_id = 2 AND 
    w.game_id = 116;
    
SELECT * FROM Wishlist WHERE user_id = 2 AND game_id = 116;

-- 3. Complex DELETE Command
DELETE r, rec
FROM VideoGame vg
JOIN Rating r ON vg.game_id = r.game_id
JOIN Recommendation rec ON vg.game_id = rec.game_id
WHERE 
    vg.publisher = 'Mystery Publisher' AND
    vg.title = 'Mystery Adventure';

SELECT * FROM Rating WHERE game_id = 1001;
