-- Question: https://leetcode.com/problems/investments-in-2016/?envType=study-plan-v2&envId=top-sql-50

-- Sol[1]
SELECT ROUND(CAST(SUM(tiv_2016) AS FLOAT),2) AS tiv_2016
FROM Insurance
WHERE CONCAT(lat,lon) NOT IN
(
    SELECT CONCAT(I1.lat,I1.lon)
    FROM Insurance I1
    GROUP BY I1.lat , I1.lon
    HAVING COUNT(*)>1
)
AND tiv_2015 IN
(
    SELECT I2.tiv_2015
    FROM Insurance I2
    GROUP BY I2.tiv_2015
    HAVING COUNT(*)>1
);

-- sol[2] Using CTE
With UniqueLatLon AS(
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat , lon
    HAVING COUNT(*)=1
),
Duplicate2015 AS(
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*)>1
)
SELECT ROUND(CAST(SUM(tiv_2016) AS FLOAT),2) AS tiv_2016
FROM Insurance
WHERE (lat,lon) IN (SELECT lat,lon FROM UniqueLatLon)
AND tiv_2015 IN (SELECT tiv_2015 FROM Duplicate2015);
