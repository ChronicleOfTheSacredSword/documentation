CREATE TABLE inventory
(
    id_hero INT NOT NULL,
    id_item INT NOT NULL,
    amount INT NOT NULL
    CONSTRAINT PK_inventory PRIMARY KEY (id_hero, id_item)
)


CREATE TABLE item
(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    usable BOOLEAN NOT NULL,
    quantity INT,
    unit INT
)