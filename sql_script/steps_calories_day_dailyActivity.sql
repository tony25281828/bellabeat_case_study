-- SHOW MEAN STEPS AND MEAN CALORIES FOR EACH ID
SELECT 
    Id,
    AVG(TotalSteps) AS mean_steps,
    AVG(Calories) AS mean_calories,
    datediff(DAY, MIN(ActivityDate), MAX(ActivityDate)) AS dayRecord
FROM dailyActivity
GROUP BY
    Id