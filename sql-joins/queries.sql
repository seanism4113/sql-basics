-- write your queries here

-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id .

SELECT * FROM owners 
    FULL JOIN vehicles 
    ON owners.id = vehicles.owner_id;

-- Count the number of cars for each owner. Display the owners first_name , last_name and count of vehicles. 
-- The first_name should be ordered in ascending order. Your output should look like this:

SELECT first_name, last_name, COUNT(owner_id) 
FROM owners 
JOIN vehicles 
ON owners.id = vehicles.owner_id
GROUP BY owners.id
ORDER BY first_name;

-- Count the number of cars for each owner and display the average price for each of the cars as integers. 
-- Display the owners first_name , last_name, average price and count of vehicles. The first_name should be ordered in 
-- descending order. Only display results with more than one vehicle and an average price greater than 10000. 
-- Your output should look like this:

SELECT first_name, last_name, CAST(AVG(price) AS int) AS average_price, COUNT(owner_id)
FROM owners 
JOIN vehicles 
ON owners.id = vehicles.owner_id
GROUP BY owners.id
HAVING AVG(vehicles.price) > 10000 AND COUNT(*) > 1
ORDER BY owners.first_name DESC;

-- TUTORIAL 6 JOIN


-- 1.
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

-- 2
SELECT id,stadium,team1,team2
  FROM game
  WHERE id = 1012

-- 3.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER'

-- 4.
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
  WHERE player LIKE '%Mario%'

-- 5.
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id
  WHERE gtime <= 10

-- 6.
SELECT mdate, teamname
  FROM game
  JOIN eteam
  ON (team1 = eteam.id)
  WHERE coach = 'Fernando Santos'

-- 7.
SELECT player 
  FROM game
  JOIN goal
  ON game.id = goal.matchid
  WHERE stadium = 'National Stadium, Warsaw'

-- 8.
SELECT DISTINCT(player)
  FROM game 
  JOIN goal 
  ON matchid = id 
  WHERE (team1='GER' OR team2='GER') 
  AND teamID <> 'GER'

-- 9.
SELECT teamname, COUNT(teamid)
  FROM eteam JOIN goal ON id=teamid
  GROUP BY teamname
  ORDER BY teamname

-- 10.
SELECT stadium, COUNT(matchid)
  FROM game
  JOIN goal
  ON id = matchid
  GROUP BY stadium

-- 11.
SELECT matchid,mdate, COUNT(teamid)
  FROM game JOIN goal ON matchid = id 
  WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY matchid

-- 12.
SELECT matchid, mdate, COUNT(teamid)
  FROM game 
  JOIN goal
  ON matchid = id
  WHERE teamid = 'GER'
  GROUP BY matchID

-- 13.
SELECT mdate,team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
  FROM game LEFT JOIN goal ON matchid = id
  GROUP BY mdate, team1, team2
  ORDER BY mdate, matchid, team1, team2


-- TUTORIAL 7 MORE JOIN OPERATIONS

-- 1.
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2.
SELECT yr
  FROM movie
  WHERE title = 'Citizen Kane'

-- 3.
SELECT id, title, yr
  FROM movie
  WHERE title LIKE '%Star Trek%'
  ORDER BY yr

-- 4.
SELECT id FROM actor
  WHERE name = 'Glenn Close'

-- 5.
SELECT id
  FROM movie
  WHERE title = 'Casablanca'

-- 6.
SELECT name 
  FROM actor
  JOIN casting
  ON actor.id = casting.actorid
  WHERE casting.movieid = 11768

-- 7.
SELECT name 
  FROM actor
  JOIN casting
  ON actor.id = casting.actorid
  JOIN movie
  ON movie.id = casting.movieid
  WHERE movie.title = 'Alien'

-- 8.
SELECT title
  FROM movie
  JOIN casting
  ON movie.id = casting.movieid
  JOIN actor
  ON actor.id = casting.actorid
  WHERE actor.name = 'Harrison Ford'

-- 9.
SELECT title
  FROM movie
  JOIN casting
  ON movie.id = casting.movieid
  JOIN actor
  ON actor.id = casting.actorid
  WHERE actor.name = 'Harrison Ford'
  AND ord <> 1

-- 10.
SELECT title, name as leading_star
  FROM movie
  JOIN casting
  ON movie.id = casting.movieid
  JOIN actor
  ON actor.id = casting.actorid
  WHERE movie.yr = 1962 AND casting.ord = 1

-- 11.
SELECT yr,COUNT(title) 
 FROM movie 
 JOIN casting 
 ON movie.id = movieid
 JOIN actor
 ON actorid = actor.id
 WHERE name = 'Rock Hudson'
 GROUP BY yr
 HAVING COUNT(title) > 2

-- 12.
SELECT movie.title, actor.name
  FROM movie, casting, actor
  WHERE movieid = movie.id
  AND actorid = actor.id
  AND casting.ord = 1
  AND movieid IN 
  (SELECT movieid FROM casting, actor
  WHERE actorid=actor.id
  AND name = 'Julie Andrews')

-- 13.
SELECT actor.name
 FROM actor
 JOIN casting 
 ON actor.id = actorid
 WHERE casting.ord = 1
 GROUP BY actor.name
 HAVING COUNT(actorid) >= 15 

-- 14.
SELECT title, COUNT(actorid)
 FROM movie
 JOIN casting
 ON movie.id = movieid
 WHERE movie.yr = 1978
 GROUP BY movie.title
 ORDER BY COUNT(actorid) DESC, movie.title

--  15.
SELECT DISTINCT actor.name
  FROM actor
  JOIN casting
  ON actor.id = actorid
  WHERE movieid in(SELECT movieid FROM casting, actor
  WHERE actorid = actor.id
  AND name = 'Art Garfunkel') 
  AND actor.name <> 'Art Garfunkel'