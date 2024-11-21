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

-- Insert Data into the Rating Table to Update the HighRatedGames View
INSERT INTO Rating (rating_id, user_id, game_id, review, rating_date, score)
VALUES (6, 3, 102, 'Excellent game!', '2024-11-22', 5);

-- Verify the HighRatedGames View After Inserting Data
SELECT * FROM HighRatedGames WHERE score >= 4;


-- View 2: WishlistSummary
CREATE OR REPLACE VIEW WishlistSummary AS
SELECT 
    u.user_id, 
    u.username, 
    COUNT(w.game_id) AS wishlist_count
FROM User u
LEFT JOIN Wishlist w ON u.user_id = w.user_id
GROUP BY u.user_id, u.username;

-- Query the WishlistSummary View
SELECT * FROM WishlistSummary WHERE wishlist_count > 2;

-- Attempt to Modify the WishlistSummary View (Will Fail)
-- Demonstrates that this view is not updatable
-- UPDATE WishlistSummary SET wishlist_count = 3 WHERE user_id = 1;

-- Correct Approach: Insert Data into the Wishlist Table
INSERT INTO Wishlist (wishlist_id, user_id, game_id, added_date, comments)
VALUES (4, 1, 103, '2024-11-23', 'Looks fun!');

-- Verify the WishlistSummary View After Inserting Data
SELECT * FROM WishlistSummary WHERE wishlist_count > 0;
