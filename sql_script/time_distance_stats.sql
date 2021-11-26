--CALCULATE MEAN DISTANCE/TIME AND TOTAL DISTANCE/TIME USING SMART DEVICES
SELECT
    Id,
    ROUND(AVG(TotalDistance), 2) AS mean_distance,
    ROUND(AVG(SedentaryMinutes + LightlyActiveMinutes + FairlyActiveMinutes + VeryActiveMinutes), 2) AS mean_time,
    ROUND(SUM(TotalDistance), 2) AS total_distance,
    SUM(SedentaryMinutes + LightlyActiveMinutes + FairlyActiveMinutes + VeryActiveMinutes) AS total_time
FROM dailyActivity
GROUP BY 
    Id
ORDER BY
    Id
