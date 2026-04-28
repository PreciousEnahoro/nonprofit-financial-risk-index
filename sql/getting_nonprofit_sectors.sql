--https://urbaninstitute.github.io/nccs/catalogs/catalog-bmf.html

--Jan 2026 Classifications
CREATE TABLE bmf AS
SELECT *
FROM read_csv_auto('C:\Users\enaho\Downloads\bmf_data.csv');

--Dec 2023 Classifications
CREATE TABLE bmf_2023 AS
SELECT *
FROM read_csv_auto('C:\Users\enaho\Downloads\bmf_2023.csv');


--Tableau File
CREATE TABLE tableau AS
SELECT *
FROM read_csv_auto('C:\Users\enaho\Downloads\nfsri_tableau_v1.csv');




CREATE TABLE ntee_sector_and_name AS

WITH base AS (
    SELECT ein_raw, org_name_display, ntee_code_major_group
    FROM bmf_2023
),
base2 AS (
    SELECT ein_raw AS einog, org_name_display, ntee_code_major_group
    FROM bmf
),
joined AS (
    SELECT 
        t.ein,
        COALESCE(
            NULLIF(base.ntee_code_major_group, ''),
            NULLIF(base2.ntee_code_major_group, ''),
            'Not Available'
        ) AS sector_raw
        
       ,  COALESCE(
            NULLIF(base.org_name_display, ''),
            NULLIF(base2.org_name_display, ''),
            'Not Available'
        ) AS org_name
    FROM tableau t
    LEFT JOIN base 
        ON t.ein = base.ein_raw
    LEFT JOIN base2 
        ON t.ein = base2.einog
)

SELECT
    *,
    CASE
        WHEN sector_raw IN (
            'Health Care',
            'Medical Research',
            'Voluntary Health Associations and Medical Disciplines',
            'Mental Health and Crisis Intervention'
        ) THEN 'Health & Medical'

        WHEN sector_raw IN (
            'Education',
            'Youth Development'
        ) THEN 'Education & Youth'

        WHEN sector_raw = 'Human Services'
            THEN 'Human Services'

        WHEN sector_raw IN (
            'Public and Societal Benefit',
            'Civil Rights, Societal Action and Advocacy'
        ) THEN 'Public & Societal Benefit'

        WHEN sector_raw IN (
            'Community Improvement and Capacity Building',
            'Housing and Shelter'
        ) THEN 'Community & Housing'

        WHEN sector_raw = 'Arts, Culture and Humanities'
            THEN 'Arts & Culture'

        WHEN sector_raw IN (
            'Environment',
            'Animal-Related'
        ) THEN 'Environment & Animals'

        WHEN sector_raw = 'International, Foreign Affairs and National Security'
            THEN 'International Affairs'

        WHEN sector_raw IN (
            'Public Safety, Disaster Preparedness and Relief',
            'Crime and Legal-Related'
        ) THEN 'Public Safety & Legal'

        WHEN sector_raw IN (
            'Science and Technology',
            'Social Science'
        ) THEN 'Science & Technology'

        WHEN sector_raw = 'Religion-Related'
            THEN 'Religion'

        WHEN sector_raw = 'Philanthropy, Voluntarism and Grantmaking Foundations'
            THEN 'Foundations & Grantmaking'

        WHEN sector_raw IN (
            'Mutual and Membership Benefit',
            'Recreation and Sports'
        ) THEN 'Membership & Recreation'

        WHEN sector_raw = 'Food, Agriculture and Nutrition'
            THEN 'Food & Agriculture'

        WHEN sector_raw = 'Employment'
            THEN 'Employment'

        ELSE 'Unknown / Unclassified'
    END AS sector_group
FROM joined;

COPY ntee_sector_and_name
TO 'C:\Users\enaho\Downloads\ntee_sector_and_name.csv'
WITH (HEADER, DELIMITER ',');
