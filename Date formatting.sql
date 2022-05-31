USE covid19;

DESC covid19_death;

-- assigning the right datatype

-- 1. Date

SELECT * FROM covid19_death;

-- Date format is dd-mm-yyyy while sql take date format yyyy-mm-dd, first, changing date column entries to sql default format

UPDATE covid19_death
SET date = str_to_date( date, "%d-%m-%Y");

ALTER TABLE covid19_death
MODIFY date date;

DESC covid19_death;



# Similarly we check Date column data type for 'covid19_vaccinations table'

DESC covid19_vaccinations;

# Date column datatype is 'text'

UPDATE covid19_vaccinations
SET date = str_to_date(date, '%d-%m-%Y');

ALTER TABLE covid19_vaccinations
MODIFY date date;




