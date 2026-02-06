CREATE TABLE IF NOT EXISTS Classes (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR NOT NULL,
    pv int NOT NULL,
    gold int NOT NULL,
    atk int NOT NULL
)

INSERT INTO Classes(name, pv, gold, atk) VALUES("Barbare",20,12,30);
INSERT INTO Classes(name, pv, gold, atk) VALUES("Assassin",10,25,40);
INSERT INTO Classes(name, pv, gold, atk) VALUES("Mendiant",1,1,10);

