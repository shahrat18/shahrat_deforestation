--Creating View--

CREATE VIEW forestaion AS
SELECT f.country_code, f.country_name, f.year, f.forest_area_sqkm, 
(100*f.forest_area_sqkm/(l.total_area_sq_mi*2.59)) as percentage_of_land, r.region, r.income_group
FROM forest_area f 
JOIN land_area l
ON f.country_code=l.country_code AND f.year=l.year
JOIN regions r
ON r.country_code=f.country_code

(l.total_area_sq_mi*2.59) as total_area_sq_km




CREATE VIEW forestaion AS
SELECT f.country_code, f.country_name, f.year, f.forest_area_sqkm, 
(100*f.forest_area_sqkm/(l.total_area_sq_mi*2.59)) as percentage_of_land, r.region, r.income_group
FROM forest_area f 
JOIN land_area l
ON f.country_code=l.country_code AND f.year=l.year
JOIN regions r
ON r.country_code=f.country_code(l.total_area_sq_mi*2.59) as total_area_sq_km

--Global Situation--

--Problem 1--
SELECT SUM(forest_area_sqkm) as Total_forest_area_1990
FROM forestaion
WHERE year= 1990 AND country_name='World'

--Problem 2--

SELECT SUM(forest_area_sqkm) as Total_forest_area_2016
FROM forestaion
WHERE year= 2016 AND country_name='World'

--Problem 3--

SELECT (
    (SELECT SUM(forest_area_sqkm) as Total_forest_area_1990
     FROM forestaion
     WHERE year = 1990 AND country_name = 'World') -
    (SELECT SUM(forest_area_sqkm) as Total_forest_area_2016
     FROM forestaion
     WHERE year = 2016 AND country_name = 'World')
) as Change_in_forest_area
FROM forestaion
LIMIT 1;

--Problem 4--


SELECT (
    (SELECT SUM(forest_area_sqkm) AS Total_forest_area_1990
     FROM forestaion
     WHERE year = 1990 AND country_name = 'World') -
    (SELECT SUM(forest_area_sqkm) AS Total_forest_area_2016
     FROM forestaion
     WHERE year = 2016 AND country_name = 'World')
) / (
    (SELECT SUM(forest_area_sqkm) AS Total_forest_area
     FROM forestaion
     WHERE year = 1990 AND country_name = 'World')
) * 100 AS percent_change
FROM forestaion
LIMIT 1

--Problem 5--

SELECT country_name, SUM(total_area_sq_mi*2.59) AS total_area_sq_km
FROM land_area
WHERE year =2016 AND (total_area_sq_mi*2.59)<=132449
GROUP BY 1
ORDER BY 2 DESC

--Regional Outlook--

--CREATE VIEW

CREATE VIEW Regional AS
SELECT R.region, l.year,
SUM(f.forest_area_sqkm) AS total_forest_area_sqkm,
SUM(l.total_area_sq_mi*2.59) AS total_land_area_sqkm,
(SUM(f.forest_area_sqkm)/SUM(l.total_area_sq_mi*2.59))*100 AS percent_forest_area

FROM forest_area f 
JOIN land_area l
ON f.country_code=l.country_code AND f.year=l.year
JOIN regions r
ON r.country_code=f.country_code
GROUP BY 1, 2
ORDER BY 1, 2;

--Problem 1. a--
SELECT ROUND(CAST(percent_forest_area AS NUMERIC), 2) AS percent_forest_area_Rounded
FROM Regional
WHERE year= 1990 AND region='World'

--Problem 1. b--

SELECT region, ROUND(CAST(percent_forest_area AS NUMERIC), 2) AS percent_forest_area_Rounded
FROM Regional
WHERE ROUND(CAST(percent_forest_area AS NUMERIC), 2)= (SELECT
MAX(ROUND(CAST(percent_forest_area AS NUMERIC), 2)) AS Highest_percent
FROM Regional
WHERE year= 2016
) AND year=2016

--PROBLEM 1. C-- 

SELECT region, ROUND(CAST(percent_forest_area AS NUMERIC), 2) AS percent_forest_area_Rounded
FROM Regional
WHERE ROUND(CAST(percent_forest_area AS NUMERIC), 2)= (SELECT
MIN(ROUND(CAST(percent_forest_area AS NUMERIC), 2)) AS Highest_percent
FROM Regional
WHERE year= 2016
) AND year=2016
 
 
 --Problem 2.a --

SELECT ROUND(CAST(percent_forest_area AS NUMERIC), 2) AS percent_forest_area_Rounded
FROM Regional
WHERE year= 2016 AND region='World'

--Problem 2. b--

SELECT region, ROUND(CAST(percent_forest_area AS NUMERIC), 2) AS percent_forest_area_Rounded
FROM Regional
WHERE ROUND(CAST(percent_forest_area AS NUMERIC), 2)= (SELECT
MAX(ROUND(CAST(percent_forest_area AS NUMERIC), 2)) AS Highest_percent
FROM Regional
WHERE year= 1990
) AND year=1990

--Problem 2. c--

SELECT region, ROUND(CAST(percent_forest_area AS NUMERIC), 2) AS percent_forest_area_Rounded
FROM Regional
WHERE ROUND(CAST(percent_forest_area AS NUMERIC), 2)= (SELECT
MIN(ROUND(CAST(percent_forest_area AS NUMERIC), 2)) AS Highest_percent
FROM Regional
WHERE year= 1990
) AND year=1990

--Problem 3 --

WITH 
    t1 AS (SELECT * FROM Regional WHERE year = 1990),
    t2 AS (SELECT * FROM Regional WHERE year = 2016)

SELECT 
    t2.region, 
    ROUND(CAST(t1.percent_forest_area AS NUMERIC), 2) as forest_area_1990,
    ROUND(CAST(t2.percent_forest_area AS NUMERIC), 2) as forest_area_2016
FROM 
    t1
JOIN 
    t2 ON t1.region = t2.region
WHERE 
    ROUND(CAST(t2.percent_forest_area AS NUMERIC), 2) < ROUND(CAST(t1.percent_forest_area AS NUMERIC), 2);

--Country-Level Detail--

--Problem 1--

WITH t1 AS
( SELECT f.country_code, f.country_name, f.year, f.forest_area_sqkm
    FROM forest_area f 
    WHERE f.year = 1990 AND f.forest_area_sqkm IS NOT NULL AND f.country_name != 'World'
),

t2 AS
( SELECT f.country_code, f.country_name, f.year, f.forest_area_sqkm
    FROM forest_area f 
    WHERE f.year=2016 AND f.forest_area_sqkm IS NOT NULL AND f.country_name != 'World'
)

SELECT t1.country_code, t1.country_name, r.region, t1.forest_area_sqkm as forest_area_1990, t2.forest_area_sqkm as forest_area_2016,
t1.forest_area_sqkm-t2.forest_area_sqkm AS forest_area_difference

FROM t1
JOIN t2
ON t1.country_code=t2.country_code
JOIN regions r
ON r.country_code=t1.country_code
ORDER BY 6 DESC
LIMIT 5

--Problem 2--

WITH t1 AS
( SELECT f.country_code, f.country_name, f.year, f.forest_area_sqkm
    FROM forest_area f 
    WHERE f.year = 1990 AND f.forest_area_sqkm IS NOT NULL AND f.country_name != 'World'
),

t2 AS
( SELECT f.country_code, f.country_name, f.year, f.forest_area_sqkm
    FROM forest_area f 
    WHERE f.year=2016 AND f.forest_area_sqkm IS NOT NULL AND f.country_name != 'World'
)

SELECT t1.country_code, t1.country_name, r.region, t1.forest_area_sqkm as forest_area_1990, t2.forest_area_sqkm as forest_area_2016,
t1.forest_area_sqkm-t2.forest_area_sqkm AS forest_area_difference,
ROUND(CAST(((t1.forest_area_sqkm-t2.forest_area_sqkm)/(t1.forest_area_sqkm)*100)AS NUMERIC),2)  AS Percent_differece


FROM t1
JOIN t2
ON t1.country_code=t2.country_code
JOIN regions r
ON r.country_code=t1.country_code
ORDER BY Percent_differece DESC
LIMIT 5

--Problem 3--

WITH t1 AS (
    SELECT 
        f.country_code,
        f.country_name,
        f.year,
        f.forest_area_sqkm,
        l.total_area_sq_mi * 2.59 AS total_land_area_sqkm,
        (f.forest_area_sqkm / (l.total_area_sq_mi * 2.59)) * 100 AS percent_forest_area
    FROM 
        forest_area f
    JOIN 
        land_area l ON f.country_code = l.country_code
                     AND (f.country_name != 'World' AND f.forest_area_sqkm IS NOT NULL AND l.total_area_sq_mi IS NOT NULL)
                     AND (f.year = 2016 AND l.year = 2016)
    ORDER BY 
        6 DESC
),
t2 AS (
    SELECT 
        t1.country_code,
        t1.country_name,
        t1.year,
        t1.percent_forest_area,
        CASE 
            WHEN t1.percent_forest_area >= 75 THEN 4
            WHEN t1.percent_forest_area < 75 AND t1.percent_forest_area >= 50 THEN 3
            WHEN t1.percent_forest_area < 50 AND t1.percent_forest_area >= 25 THEN 2
            ELSE 1
        END AS percentile
    FROM 
        t1 
    ORDER BY 
        5 DESC
)

SELECT 
    t2.percentile, 
    COUNT(t2.percentile)
FROM 
    t2
GROUP BY 
    1
ORDER BY 
    2 DESC;

-- Problem 4 --

WITH t1 AS (
    SELECT 
        f.country_code,
        f.country_name,
        f.year,
        f.forest_area_sqkm,
        l.total_area_sq_mi * 2.59 AS total_land_area_sqkm,
        (f.forest_area_sqkm / (l.total_area_sq_mi * 2.59)) * 100 AS percent_forest_area
    FROM 
        forest_area f
    JOIN 
        land_area l ON f.country_code = l.country_code
                     AND (f.country_name != 'World' AND f.forest_area_sqkm IS NOT NULL AND l.total_area_sq_mi IS NOT NULL)
                     AND (f.year = 2016 AND l.year = 2016)
    ORDER BY 6 DESC
),
t2 AS (
    SELECT 
        t1.country_code,
        t1.country_name,
        t1.year,
        t1.percent_forest_area,
        CASE 
            WHEN t1.percent_forest_area >= 75 THEN 4
            WHEN t1.percent_forest_area < 75 AND t1.percent_forest_area >= 50 THEN 3
            WHEN t1.percent_forest_area < 50 AND t1.percent_forest_area >= 25 THEN 2
            ELSE 1
        END AS percentile
    FROM t1 
    ORDER BY 5 DESC
)

SELECT t2.country_name, r.region,
        ROUND(CAST(t2.percent_forest_area AS NUMERIC), 2) AS percent_forest_area,
        t2.percentile
        
FROM t2
JOIN regions.r
ON t2.country_code= r.country_code
WHERE t2.percentile= 4
ORDER BY 1;

--Problem 5--



WITH t1 AS (
    SELECT 
        f.country_code,
        f.country_name,
        f.year,
        f.forest_area_sqkm,
        l.total_area_sq_mi * 2.59 AS total_land_area_sqkm,
        (f.forest_area_sqkm / (l.total_area_sq_mi * 2.59)) * 100 AS percent_forest_area
    FROM 
        forest_area f
    JOIN 
        land_area l ON f.country_code = l.country_code
                     AND (f.country_name != 'World' AND f.forest_area_sqkm IS NOT NULL AND l.total_area_sq_mi IS NOT NULL)
                     AND (f.year = 2016 AND l.year = 2016)
    ORDER BY 6 DESC
),

SELECT COUNT(t1.country_name)
FROM t1
WHERE t1.percent_forest_area>(
    SELECT t1.percent_forest_area
    from t1
    WHEN t1. country_name= 'United States'
)



































