--SHOW INTENSITIES FIGURES FOR EACH ID
SELECT 
    DA.Id,
    ROUND(AVG(DI.SedentaryMinutes), 0) AS mean_sedentary_min,
    ROUND(AVG(DI.LightlyActiveMinutes), 0) AS mean_lightly_min,
    ROUND(AVG(DI.FairlyActiveMinutes), 0) AS mean_fairly_min,
    ROUND(AVG(DI.VeryActiveMinutes), 0) AS mean_active_min,
    DATEDIFF(DAY, MIN(DA.ActivityDate), MAX(DA.ActivityDate))+1 AS days_use_dailyActivity,
    DATEDIFF(DAY, MIN(DI.ActivityDay), MAX(DI.ActivityDay))+1 AS days_use_dailyIntensities,
    ROUND(AVG(DI.SedentaryMinutes), 0) + ROUND(AVG(DI.LightlyActiveMinutes), 0) + ROUND(AVG(DI.FairlyActiveMinutes), 0) + ROUND(AVG(DI.VeryActiveMinutes), 0) AS mean_of_use
FROM dailyIntensities AS DI
FULL OUTER JOIN dailyActivity AS DA
ON DA.Id = DI.Id
GROUP BY 
    DA.Id
ORDER BY 
    mean_of_use DESC