-- Таблиця фільмів
CREATE TABLE MOVIE (
    movie_id BIGSERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INTEGER
);

-- Таблиця акторів
CREATE TABLE ACTOR (
    actor_id BIGSERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    birth_date DATE
);

-- Таблиця ролей
CREATE TABLE ROLE (
    role_id BIGSERIAL PRIMARY KEY,
    role_title VARCHAR(255) NOT NULL
);

-- Таблиця акторського складу (Зв'язок Movie + Actor + Role)
CREATE TABLE MOVIE_CAST (
    mc_id BIGSERIAL PRIMARY KEY,
    movie_id BIGINT REFERENCES MOVIE(movie_id) ON DELETE CASCADE,
    actor_id BIGINT REFERENCES ACTOR(actor_id) ON DELETE CASCADE,
    role_id BIGINT REFERENCES ROLE(role_id) ON DELETE SET NULL
);


--Скріпт для генерації різної кількості даних таблиць БД:
BEGIN;
    -- Встановлюємо ім'я користувача для поточної транзакції
    SET LOCAL app.current_user_name = 'Pavlo_Manager';
TRUNCATE TABLE MOVIE_CAST CASCADE;
TRUNCATE TABLE ACTOR CASCADE;
TRUNCATE TABLE MOVIE CASCADE;
TRUNCATE TABLE ROLE CASCADE;

-- 2. ГЕНЕРАЦІЯ РОЛЕЙ (Маленька довідкова таблиця)
INSERT INTO ROLE (role_id, role_title)
SELECT s, 'Role Type ' || s
FROM generate_series(1, 100) AS s;

-- 3. ГЕНЕРАЦІЯ ФІЛЬМІВ (MOVIE)
-- Створюємо 10,000 фільмів (можна змінити на 1k або 100k)
INSERT INTO MOVIE (movie_id, title, release_year)
SELECT
    s,
    'Movie Title ' || s,
    (1900 + (random() * 125))::int -- Фільми з 1900 по 2025 роки
FROM generate_series(1, 10000) AS s;

-- 4. ГЕНЕРАЦІЯ АКТОРІВ (ACTOR)
-- 100,000 акторів
INSERT INTO ACTOR (actor_id, full_name, birth_date)
SELECT
    s,
    'Actor Name ' || s,
    '1950-01-01'::date + (random() * 20000)::int * '1 day'::interval
FROM generate_series(1, 100000) AS s;

-- 5. ГЕНЕРАЦІЯ ЗВ'ЯЗКІВ (MOVIE_CAST)
-- Генеруємо 500,000 записів
-- Робимо так, щоб актори з ID > 80,000 не мали ролей (для тестів NOT EXISTS)
INSERT INTO MOVIE_CAST (mc_id, movie_id, actor_id, role_id)
SELECT
    s,
    (1 + floor(random() * 10000))::int, -- Випадковий ID фільму від 1 до 10000
    (1 + floor(random() * 80000))::int, -- Випадковий ID актора ТІЛЬКИ з перших 80к
    (1 + floor(random() * 100))::int    -- Випадкова роль від 1 до 100
FROM generate_series(1, 500000) AS s;

COMMIT;



