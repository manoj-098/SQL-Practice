-- Question: https://leetcode.com/problems/movie-rating/?envType=study-plan-v2&envId=top-sql-50

-- Sol[1] - the following solution can furhter be simplified using JOIN instead of subquery
(SELECT Users.name AS results
FROM Users
WHERE Users.user_id = (
    SELECT user_id
    FROM MovieRating
    GROUP BY user_id
    ORDER BY COUNT(*) DESC,(SELECT Users.name FROM Users WHERE Users.user_id = MovieRating.user_id) ASC
    LIMIT 1
))
UNION ALL
(SELECT Movies.title AS results
FROM Movies
WHERE Movies.movie_id = (
    SELECT movie_id
    FROM MovieRating
    WHERE created_at LIKE "2020-02-%"
    GROUP BY movie_id
    ORDER BY AVG(rating) DESC, (SELECT Movies.title FROM Movies WHERE Movies.movie_id = MovieRating.movie_id) ASC
    LIMIT 1
));

-- sol[2] Using CTE
WITH FinalTable AS(
    SELECT MovieRating.movie_id, M.title, MovieRating.user_id,  U.name, MovieRating.rating,MovieRating.created_at
    FROM MovieRating
    LEFT JOIN Movies AS M
    ON MovieRating.movie_id = M.movie_id
    LEFT JOIN Users AS U
    ON MovieRating.user_id = U.user_id
)
(
    SELECT name AS results
    FROM FinalTable
    GROUP BY user_id
    ORDER BY COUNT(*) DESC, name ASC
    LIMIT 1)
UNION ALL
(
    SELECT title
    FROM FinalTable
    WHERE created_at LIKE "2020-02-%"
    GROUP BY movie_id
    ORDER BY AVG(rating) DESC, title ASC
    LIMIT 1
);

-- ===========================================================
--                      CTE OUTPUT
-- ===========================================================

-- | movie_id | title    | user_id | name   | rating | created_at |
-- | -------- | -------- | ------- | ------ | ------ | ---------- |
-- | 1        | Avengers | 1       | Daniel | 3      | 2020-01-12 |
-- | 1        | Avengers | 2       | Monica | 4      | 2020-02-11 |
-- | 1        | Avengers | 3       | Maria  | 2      | 2020-02-12 |
-- | 1        | Avengers | 4       | James  | 1      | 2020-01-01 |
-- | 2        | Frozen 2 | 1       | Daniel | 5      | 2020-02-17 |
-- | 2        | Frozen 2 | 2       | Monica | 2      | 2020-02-01 |
-- | 2        | Frozen 2 | 3       | Maria  | 2      | 2020-03-01 |
-- | 3        | Joker    | 1       | Daniel | 3      | 2020-02-22 |
-- | 3        | Joker    | 2       | Monica | 4      | 2020-02-25 |
