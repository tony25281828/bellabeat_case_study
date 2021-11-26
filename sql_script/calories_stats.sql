--SHOW CALORIES FIGURES FOR EACH ID
SELECT 
    DA.Id,
    ROUND(AVG(DC.Calories), 0) AS mean_calories,
    MAX(DC.Calories) AS max_calories,
    MIN(DC.Calories) AS min_calories,
    DATEDIFF(DAY, MIN(DA.ActivityDate), MAX(DA.ActivityDate))+1 AS days_use_dailyActivity,
    DATEDIFF(DAY, MIN(DC.ActivityDay), MAX(DC.ActivityDay))+1 AS days_use_dailyCalories
FROM dailyCalories AS DC
FULL OUTER JOIN dailyActivity AS DA
ON DA.Id = DC.Id
GROUP BY 
    DA.Id
ORDER BY 
    DA.Id