--SHOW DISTANCE AND TIME STATS AND BMI INFORMATION
SELECT
    DA.Id,
    ROUND(AVG(DA.TotalDistance), 2) AS mean_distance,
    ROUND(AVG(DA.SedentaryMinutes + DA.LightlyActiveMinutes + DA.FairlyActiveMinutes + DA.VeryActiveMinutes), 2) AS mean_time,
    ROUND(SUM(DA.TotalDistance), 2) AS total_distance,
    SUM(DA.SedentaryMinutes + DA.LightlyActiveMinutes + DA.FairlyActiveMinutes + DA.VeryActiveMinutes) AS total_time,
    ROUND(AVG(WL.BMI), 2) AS mean_BMI
FROM dailyActivity AS DA
FULL JOIN weightLogInfo AS WL
ON DA.Id = WL.Id
GROUP BY 
    DA.Id
ORDER BY
    DA.Id