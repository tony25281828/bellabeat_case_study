--SHOW INTENSITIES FIGURES FOR EACH ID
SELECT 
    DA.Id,
    ROUND(AVG(DI.SedentaryMinutes), 0) AS mean_sedentary_min,
    ROUND(AVG(DI.SedentaryActiveDistance), 2) AS mean_sedentary_dis,
    ROUND(AVG(DI.LightlyActiveMinutes), 0) AS mean_lightly_min,
    ROUND(AVG(DI.LightActiveDistance), 2) AS mean_lightly_dis,
    ROUND(AVG(DI.FairlyActiveMinutes), 0) AS mean_fairly_min,
    ROUND(AVG(DI.ModeratelyActiveDistance), 2) AS mean_mod_dis,
    ROUND(AVG(DI.VeryActiveMinutes), 0) AS mean_active_min,
    ROUND(AVG(DI.VeryActiveDistance), 2) AS mean_active_dis,
    DATEDIFF(DAY, MIN(DA.ActivityDate), MAX(DA.ActivityDate))+1 AS days_use_dailyActivity,
    DATEDIFF(DAY, MIN(DI.ActivityDay), MAX(DI.ActivityDay))+1 AS days_use_dailyIntensities
FROM dailyIntensities AS DI
FULL OUTER JOIN dailyActivity AS DA
ON DA.Id = DI.Id
GROUP BY 
    DA.Id
ORDER BY 
    DA.Id