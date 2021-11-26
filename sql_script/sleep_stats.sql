-- Sleep statistics vs the days of use smart devices when sleeping and days of records
SELECT 
    DA.Id,
    ROUND(AVG(TotalMinutesAsleep), 0) AS mean_min_asleep,
    ROUND(AVG(TotalTimeInBed), 0) AS mean_min_bed,
    MAX(TotalMinutesAsleep) AS max_asleap,
    MIN(TotalMinutesAsleep) AS min_asleep,
    ROUND(AVG(TotalTimeInBed), 0) - ROUND(AVG(TotalMinutesAsleep), 0) AS time_awake_in_bed,
    DATEDIFF(DAY, MIN(DA.ActivityDate), MAX(DA.ActivityDate))+1 AS days_of_use_dailyActivities,
    DATEDIFF(DAY, MIN(SD.SleepDay), MAX(SD.SleepDay))+1 AS days_of_use_sleepDay
FROM sleepDay AS SD
FULL JOIN dailyActivity AS DA
ON
    SD.Id = DA.Id
GROUP BY 
    DA.Id
ORDER BY 
    DA.Id



