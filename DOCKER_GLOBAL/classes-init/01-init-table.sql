-- Create table
CREATE TABLE IF NOT EXISTS Classes (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_hero INT DEFAULT 0,
    name VARCHAR(255) NOT NULL,
    pv INT NOT NULL,
    gold INT NOT NULL,
    atk INT NOT NULL
);

INSERT INTO Classes(name, pv, gold, atk) VALUES('Barbare', 20, 12, 30);
INSERT INTO Classes(name, pv, gold, atk) VALUES('Assassin', 10, 25, 40);
INSERT INTO Classes(name, pv, gold, atk) VALUES('Mendiant', 1, 1, 10);

