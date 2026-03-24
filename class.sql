SELECT * FROM residents;

DROP TABLE resdents;


ALTER TABLE residents
ADD COLUMN IF NOT EXISTS village_section VARCHAR(50);


CREATE TYPE gender_type AS ENUM ('Male', 'Female');
CREATE TABLE IF NOT EXISTS residents (
	resident_id SERIAL PRIMARY KEY,
	full_name VARCHAR(255) NOT NULL,
	date_of_birth DATE,
	gender gender_type NOT NULL,
	Occupation VARCHAR(100),
	is_head_of_household BOOLEAN DEFAULT FALSE
)




INSERT INTO residents (full_name, date_of_birth, gender, occupation, is_head_of_household, village_section) 
VALUES
('Musoke John', '2002-05-12', 'Male', 'Poultry Farmer', false, 'Kiwatule Central'),
('musoke sarah', '1956-11-20', 'Female', 'Retired', true, 'Bwaise II'),
('MUSOKE PETER', '2021-01-15', 'Male', 'None', false, 'Kiwatule Central'),
('Nakasujja Jane', '1995-03-22', 'Female', 'Teacher', true, 'Bwaise II'),
('Ochen David', '2005-08-30', 'Male', 'Unemployed', false, 'Muyenga Hill'),
('Mubiru Moses', '1949-06-05', 'Male', 'Crop Farmer', true, 'Kiwatule Central'),
('Namukasa Mary', '2021-12-10', 'Female', 'None', false, 'Muyenga Hill'),
('Ssewankambo Isaac', '1979-09-14', 'Male', 'Fish Farmer', true, 'Bwaise II');

SELECT * FROM residents
WHERE full_name='Musoke John';

SELECT * FROM residents
WHERE full_name LIKE 'Musoke John%';

SELECT * FROM residents
WHERE full_name LIKE'%uso%';

SELECT * FROM residents
WHERE full_name ILIKE '%musoke%' ;

SELECT full_name,occupation
FROM residents
WHERE gender='Female' AND is_head_of_household=true ; 


