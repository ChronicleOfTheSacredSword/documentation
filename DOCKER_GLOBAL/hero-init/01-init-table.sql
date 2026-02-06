CREATE TABLE public.heroes (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_user INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    class INT NOT NULL,
    pv INT NOT NULL,
    atk INT NOT NULL,
    lvl INT NOT NULL DEFAULT 1,
    xp INT NOT NULL DEFAULT 0,
    gold INT NOT NULL DEFAULT 0
);

INSERT INTO public.heroes (id_user, name, class, pv, atk, lvl, xp, gold)
VALUES (1, 'Link', 1, 100, 15, 1, 0, 50);
