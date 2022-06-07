USE covid19;
-- All over the World
-- 1. Total Number of Cases, Total number of Deaths and Deathpercentage

SELECT SUM(total_cases) FROM covid19_death;         								 -- 323599922690

SELECT SUM(total_deaths) FROM covid19_death;										-- 5778781414

select (SUM(total_deaths)/SUM(total_cases)) * 100 AS deathpercentage FROM covid19_death; 	-- 1.7857796027769501   %  

-- OR

select ROUND((SUM(total_deaths)/SUM(total_cases)) * 100, 2) AS deathpercentage FROM covid19_death; 	     -- 1.79 %




-- 2. What percent of populations was affected by the covid19; Total number of cases V/S Total population

SELECT SUM(population) FROM covid19_death;											-- 11087908727684

SELECT SUM(total_cases) FROM covid19_death;         								 -- 323599922690

SELECT ROUND((SUM(total_cases)/ SUM(population)) * 100, 2) AS CasePercent FROM covid19_death;  -- 2.92 %



-- Location Wise

-- 3. Locations details

SELECT DISTINCT(location) FROM covid19_death;      -- 240 countries


-- 4. Looking at loacations with Hightest Infection Rate compared to population

-- infection rate = (total number of cases / population ) * 100

SELECT location, ROUND((SUM(total_cases)/ SUM(population) ) * 100 , 2) AS infection_rate FROM covid19_death
GROUP BY location;



-- 5. Which location has the hightest infection rate

SELECT location, ROUND((SUM(total_cases)/ SUM(population) ) * 100 , 2) AS infection_rate FROM covid19_death
GROUP BY location 
ORDER BY infection_rate DESC
LIMIT 1;



-- 6. Top ten hightest infection rate countries

SELECT location, ROUND((SUM(total_cases)/ SUM(population) ) * 100 , 2) AS infection_rate FROM covid19_death
GROUP BY location 
ORDER BY infection_rate DESC
LIMIT 10 ;


-- 7. How many locations have 0 infection rate
SELECT location, (SUM(total_cases)/ SUM(population))* 100 AS infection_rate FROM covid19_death
GROUP BY location 
HAVING infection_rate = 0
ORDER BY infection_rate DESC;     -- 15 locations have 0 % infection rate

-- 8. Locations with highest death  count.

SELECT location, SUM(total_deaths) AS loc_total_deaths FROM covid19_death
GROUP BY location
ORDER BY loc_total_deaths DESC;

-- 9. Top 10 Locations with highest death count.

SELECT location, SUM(total_deaths) AS loc_total_deaths FROM covid19_death
GROUP BY location
ORDER BY loc_total_deaths DESC
LIMIT 10;


-- 9. Locations with highest death count per populations.

SELECT location, ROUND((SUM(total_deaths)/ SUM(population) ) * 100 , 2) AS death_per_population FROM covid19_death
GROUP BY location
ORDER BY death_per_population DESC;

-- CONTINANTS

SELECT DISTINCT(continent) FROM covid19_death;  -- 7 contintents in which one is blank

-- 10. Showing continents Hightest death count

SELECT continent, SUM(total_deaths) AS conti_total_deaths FROM covid19_death
GROUP BY continent
ORDER BY conti_total_deaths DESC;


-- 11. Showing continents Hightest death count per population
SELECT continent, ROUND((SUM(total_deaths)/SUM(population)) * 100 , 2) AS con_death_per_population 
FROM covid19_death
GROUP BY continent
ORDER BY con_death_per_population DESC; 				





