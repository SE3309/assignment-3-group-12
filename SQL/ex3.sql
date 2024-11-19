INSERT INTO User (user_id, username, password, age, registration_date)
VALUES (1, 'basicUser', 'password123', 28, '2024-11-15');

INSERT INTO User (user_id, username, password) 
VALUES (2, 'partialUser', 'partialPass456');

INSERT INTO User (user_id, username, password, age, registration_date)
SELECT 3, 'userCopy', password, age, registration_date
FROM User
WHERE user_id = 1;

SELECT * FROM User;