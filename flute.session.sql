CREATE TABLE Messages(
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    timestamp datetime DEFAULT CURRENT_TIMESTAMP,
    message TEXT
);

-- @block
CREATE TABLE Users(
    username VARCHAR(255) PRIMARY KEY,
    password BINARY(60)
);

-- To delete table
-- @block 
DROP TABLE Messages;
-- @block 
DROP TABLE Users;
