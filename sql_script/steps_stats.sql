--SHOW STEPS FIGURES FOR EACH ID
SELECT 
    DA.Id,
    ROUND(AVG(DS.StepTotal), 0) AS mean_steps,
    MAX(DS.StepTotal) AS max_steps,
    MIN(DS.StepTotal) AS min_steps,
    DATEDIFF(DAY, MIN(DA.ActivityDate), MAX(DA.ActivityDate))+1 AS days_use_dailyActivity,
    DATEDIFF(DAY, MIN(DS.ActivityDay), MAX(DS.ActivityDay))+1 AS days_use_dailySteps
FROM dailySteps AS DS
FULL OUTER JOIN dailyActivity AS DA
ON DA.Id = DS.Id
GROUP BY 
    DA.Id
ORDER BY 
    DA.Id

--Min steps might be meaningless because people can sit or lay without moving

