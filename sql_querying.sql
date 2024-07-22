-- ## **Part 1: SQLZoo**
-- Head to [SQL Zoo](https://sqlzoo.net/) and complete tutorials 0, 1, 2, and 3.

-- Tutotial 0
-- 1.
SELECT population FROM world WHERE name = 'Germany';

-- 2.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

-- Tutorial 1
-- 1.
SELECT name FROM world
  WHERE name LIKE 'Y%'

-- 2.
SELECT name FROM world
  WHERE name LIKE '%y'

-- 3.
SELECT name FROM world
  WHERE name LIKE '%x%'

-- 4.
SELECT name FROM world
  WHERE name LIKE '%land'

-- 5.
SELECT name FROM world
  WHERE name LIKE 'C%' and name LIKE '%ia'

-- 6.
SELECT name FROM world
  WHERE name LIKE '%oo%'

-- 7.
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

-- 8.
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

-- 9.
SELECT name FROM world
 WHERE name LIKE '%o__o%'

--  10.
SELECT name FROM world
 WHERE name LIKE '____'

--  11.
SELECT name
  FROM world
 WHERE name = capital

--  12.
SELECT name
  FROM world
 WHERE capital = concat(name, ' City');

-- 13.
SELECT capital,name FROM world 
 WHERE capital LIKE concat('%',name,'%');

--  14.
SELECT capital,name
  FROM world
 WHERE capital LIKE concat('%',name,'%') AND capital > name

--  15.
SELECT name, REPLACE(capital,name,'')
  FROM world
 WHERE capital LIKE concat('%',name,'%') AND capital > name

 -- Tutorial 2
-- 1.
SELECT name, continent, population FROM world

-- 2.
SELECT name FROM world
WHERE population >= 200000000

-- 3.
SELECT name,gdp/population FROM world
 WHERE population >= 200000000

--  4.
SELECT name, population/1000000
 FROM world
 WHERE continent = 'South America'

--  5.
SELECT name, population
 FROM world
 WHERE name IN ('France','Germany','Italy')

--  6.
SELECT name
 FROM world
 WHERE name like '%United%'

--  7.
SELECT name,population,area
 FROM world
 WHERE area > 3000000 OR population > 250000000

--  8.
SELECT name,population,area
 FROM world
 WHERE area > 3000000 AND population < 250000000
 OR area < 3000000 AND population > 250000000

--  9.
SELECT name,ROUND(population/1000000,2),ROUND(gdp/1000000000,2)
 FROM world
 WHERE continent = 'South America'

--  10.
SELECT name,ROUND(gdp/population,-3)
 FROM world
 WHERE gdp >= 1000000000000

--  11.
SELECT name, capital
  FROM world
 WHERE LENGTH(name) = LENGTH(capital)

--  12.
SELECT name, capital
 FROM world
 WHERE capital <> name AND LEFT(name,1) = LEFT(capital,1)

--  13.
SELECT name FROM world 
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %'

-- Tutorial 3
-- 1.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

--  2.
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature'

-- 3.
SELECT yr,subject
 FROM nobel
 WHERE winner = 'Albert Einstein'

--  4.
SELECT winner
 FROM nobel
 WHERE subject = 'peace' and yr >= 2000

-- 5.
SELECT * FROM nobel
 WHERE yr BETWEEN 1980 AND 1989 
 AND subject = 'literature'

--  6.
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt','Thomas Woodrow Wilson','Jimmy Carter', 'Barack Obama')

--  7.
SELECT winner
 FROM nobel
 WHERE winner LIKE 'John%'

--  8.
SELECT * FROM nobel
 WHERE subject = 'physics' AND yr = 1980
 OR subject = 'chemistry' AND yr = 1984

-- 9.
SELECT * FROM nobel
 WHERE yr = 1980 AND subject <> 'chemistry' AND subject <> 'medicine' 

--  10.
SELECT * FROM nobel
 WHERE subject = 'Medicine' and yr < 1910
 OR subject = 'Literature' and yr >= 2004

--  11.
SELECT * FROM nobel
 WHERE winner = 'PETER GRÜNBERG'

  -- 12.
SELECT * FROM nobel
 WHERE winner = 'EUGENE O''NEILL'

--  13.
SELECT winner,yr,subject FROM nobel
 WHERE LEFT(winner,3) = 'Sir'
 ORDER BY yr DESC,winner

--  14.
SELECT winner, subject
  FROM nobel
 WHERE yr = 1984
 ORDER BY subject IN('physics','chemistry'),subject,winner

--  ## **Part 2: More SQL (Including aggregates)**
-- Complete the following code SQL challenges on Codewars:

-- SQL Basics: Simple WHERE and ORDER BY
-- Create your SELECT statement here
SELECT * FROM people
WHERE age > 50
ORDER BY age DESC;

-- SQL Basics: Simple SUM
SELECT SUM(age) as age_sum FROM people

-- SQL Basics: Simple MIN / MAX
SELECT MIN(age) as age_min,MAX(age) as age_max FROM people

-- Find all active students
SELECT * FROM students WHERE IsActive = 1

-- SQL Basics: Simple GROUP BY
SELECT age,COUNT(people) as people_count FROM people
GROUP BY age

-- SQL Basics: Simple HAVING
SELECT age,COUNT(*) AS total_people FROM people
GROUP BY age HAVING Count(*) >= 10

-- Tutorial 5 SUM and COUNT In which we apply aggregate functions. more the same

-- 1.
SELECT SUM(population)
FROM world

-- 2.
SELECT DISTINCT(continent)
FROM world

-- 3.
SELECT SUM(gdp) 
 FROM world
 WHERE continent = "Africa"

--  4.
SELECT COUNT(name)
 FROM world
 WHERE area >= 1000000

--  5.
SELECT SUM(population)
 FROM world
 WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

--  6.
SELECT continent,COUNT(*)
 FROM world
 GROUP BY continent
 HAVING Count(*)

--  7.
SELECT continent, COUNT(*)
FROM world
WHERE population >= 10000000
GROUP BY continent
HAVING COUNT(*)

-- 8.
SELECT continent
 FROM world
 GROUP BY continent
 HAVING SUM(population) >= 100000000

 Part 3: Products Querying