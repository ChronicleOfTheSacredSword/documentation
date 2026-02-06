CREATE TABLE inventory (
    id_hero INT NOT NULL,
    id_item INT NOT NULL,
    amount INT NOT NULL,
    CONSTRAINT pk_inventory PRIMARY KEY (id_hero, id_item)
);

CREATE TABLE item (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    usable BOOLEAN NOT NULL,
    quantity INT,
    unit VARCHAR(100)
);

ALTER TABLE inventory
ADD CONSTRAINT fk_inventory_item
FOREIGN KEY (id_item) REFERENCES item(id);

INSERT INTO item (name, usable, quantity, unit) VALUES 
('Potion de vie', true, 50, 'PV'),  
('Potion de force', true,20, 'ATK'),  
('Bourse perdue', true,  200, 'GOLD'),   
('Corne de Ganon', false, null, null);

INSERT INTO inventory (id_hero, id_item, amount) VALUES 
(1, 1, 5),  
(1, 2, 3), 
(1, 3, 1),  
(1, 4, 1); 
