--FOR Data transformation 

SELECT * FROM residents;

--AS
SELECT full_name AS "Name",
gender AS "Gender",
occupation AS "Job",
Village_section AS "Ward" 
FROM residents;


--DATA TRANSPORTION ->TO UPPER
SELECT UPPER (full_name) AS "Name",
gender AS "Gender",
occupation AS "Job",
Village_section AS "Ward" 
FROM residents;


--INITCAP THE PROFESION WAY TO FILED
SELECT INITCAP(full_name) AS "Name",
gender AS "Gender",
occupation AS "Job",
Village_section AS "Ward" 
FROM residents;


--YEAR EXTRACT FOR Year in the resident
SELECT  full_name,
date_of_birth,
EXTRACT(YEAR FROM date_of_birth) AS birth_year
FROM residents;


--month extraction
SELECT  full_name,
date_of_birth,
EXTRACT(MONTH FROM date_of_birth) AS birth_month
FROM residents;


--day extraction
SELECT  full_name,
date_of_birth,
EXTRACT(DAY FROM date_of_birth) AS birth_month
FROM residents;

--the name of the day 
SELECT  full_name,
date_of_birth,
TO_CHAR(date_of_birth,'DAY') AS birth_day
FROM residents;

--change it the month from intergers to stings
--TO_CHAR changes month from int of month to name of the month in atext 
SELECT  full_name,
date_of_birth,
TO_CHAR (date_of_birth ,'Month') AS birth_month
FROM residents;

--math logic ->using the extract fuction
SELECT full_name,
date_of_birth,
(EXTRACT (YEAR FROM CURRENT_DATE)-EXTRACT(YEAR FROM date_of_birth)) AS AGE
FROM residents;


-- AGE FUNCTION
SELECT full_name,
date_of_birth,
AGE(date_of_birth) AS precise_age,
EXTRACT (YEAR FROM AGE(date_of_birth)) AS years_only
FROM residents;


--AGE FUNCTION WITH WHERE
SELECT full_name,
date_of_birth,
AGE(date_of_birth) AS precise_age,
EXTRACT (YEAR FROM AGE(date_of_birth)) AS years_only
FROM residents
WHERE EXTRACT (YEAR FROM AGE(date_of_birth))<30;


--AGE FUNCTION WITH WHERE ,ORDER BY clause
SELECT full_name,
date_of_birth,
AGE(date_of_birth) AS precise_age,
EXTRACT (YEAR FROM AGE(date_of_birth)) AS years_only
FROM residents
WHERE EXTRACT (YEAR FROM AGE(date_of_birth))<30
ORDER BY EXTRACT (YEAR FROM AGE(date_of_birth));


--17/march/2026
--Data
--add new columns
ALTER TABLE residents ADD COLUMN first_name VARCHAR(50);
ALTER TABLE residents ADD COLUMN last_name VARCHAR(50);

--fetching 
SELECT * FROM residents;


--update spliting the full_name

UPDATE residents 
SET first_name=split_part(full_name,' ',1),
last_name=split_part(full_name,' ',2);
 /* spliting the data we should cater for the space also in the command 
eg SET first_name=split_part(full_name,' ',1),
first_name=split_part(full_name,' ',2)
*/

ALTER TABLE residents DROP COLUMN full_name;

INSERT INTO residents (first_name, last_name, date_of_birth, village_section, gender, occupation) VALUES
('Samuel', 'Kariuki', '2023-03-14', 'Kiwatule Central', 'Male', 'None'),
('Mercy', 'Wanjiku', '1995-07-22', 'Bwaise II', 'Female', 'Teacher'),
('Isaac', 'Otieno', '1981-11-30', 'Muyenga Hill', 'Male', 'Crop Farmer'),
('Sarah', 'Achieng', '2019-05-12', 'Kawempe I', 'Female', 'Student'),
('David', 'Mutua', '2007-09-05', 'Kyebando', 'Male', 'Unemployed'),
('Jane', 'Nekesa', '1974-12-18', 'Kiwatule Central', 'Female', 'Poultry Farmer'),
('Peter', 'Kamau', '2016-02-25', 'Bwaise II', 'Male', 'Student'),
('Faith', 'Mumbua', '2004-06-08', 'Muyenga Hill', 'Female', 'Nurse'),
('Geoffrey', 'Omondi', '1966-08-20', 'Kawempe I', 'Male', 'Retired'),
('Alice', 'Zamani', '1997-01-15', 'Kyebando', 'Female', 'Tailor'),
('Brian', 'Kibet', '1993-10-03', 'Kiwatule Central', 'Male', 'Software Developer'),
('Grace', 'Chebet', '2021-04-27', 'Bwaise II', 'Female', 'None'),
('Kevin', 'Maina', '1985-12-11', 'Muyenga Hill', 'Male', 'Carpenter'),
('Rose', 'Anyango', '1991-03-19', 'Kawempe I', 'Female', 'Hairdresser'),
('Hassan', 'Ali', '1976-07-07', 'Kyebando', 'Male', 'Civil Servant'),
('Esther', 'Njeri', '2005-09-29', 'Kiwatule Central', 'Female', 'Unemployed'),
('Philip', 'Okoth', '1978-05-24', 'Bwaise II', 'Male', 'Mechanic'),
('Catherine', 'Nduta', '1999-08-14', 'Muyenga Hill', 'Female', 'Teacher'),
('James', 'Musandu', '1987-02-02', 'Kawempe I', 'Male', 'Crop Farmer'),
('Lydia', 'Atieno', '1996-11-17', 'Kyebando', 'Female', 'Social Worker');


SELECT gender,COUNT(*) AS head_count
FROM residents
GROUP BY gender;

--order the data
SELECT gender,COUNT(*) AS head_count
FROM residents
GROUP BY gender 
ORDER BY head_count DESC;

--TASK 4

SELECT village_section,
ROUND (AVG(EXTRACT(YEAR FROM AGE(date_of_birth)))::numeric,2) AS average_age
FROM residents
GROUP BY village_section
ORDER BY average_age DESC;

--TASK 5 

SELECT occupation,
COUNT(*) AS  total_workers
FROM residents
WHERE occupation !='None'
GROUP BY occupation
ORDER BY total_workers DESC;

--only farmers
SELECT occupation,
COUNT(*) AS  total_workers
FROM residents
WHERE occupation ='farmer'
GROUP BY occupation
ORDER BY total_workers DESC;

SELECT occupation, COUNT(*) AS JOB
FROM residents
WHERE occupation IN ('fishfarmer','cropfarmer')  
group by JOB;

select * from residents;

--FOR THE VULNERABIITY








