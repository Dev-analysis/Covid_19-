USE covid19;
SELECT * FROM covid19_vaccinations;

-- 1 Total number of vaccinations
SELECT SUM(total_vaccinations)  FROM covid19_vaccinations;        # 10913139885027

-- 2 Joining boths tables based on locations and date

SELECT * 
FROM covid19.covid19_death AS death
JOIN covid19.covid19_vaccinations AS vacci
ON death.location = vacci.location
	AND death.date = vacci.date;




-- Looking at Total Populations vs Vaccinations

SELECT death.continent, death.location, death.date,
death.population, vacci.new_vaccinations
FROM covid19.covid19_death AS death
JOIN covid19.covid19_vaccinations AS vacci
ON death.location = vacci.location
	AND death.date = vacci.date
WHERE death.continent IS NOT NULL
ORDER BY 1, 2 ,3 ;



