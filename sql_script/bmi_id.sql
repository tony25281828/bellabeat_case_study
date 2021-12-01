SELECT 
    Id,
    AVG(BMI) AS mean_bmi,
    COUNT(Id) AS num_records
FROM weightLogInfo
GROUP BY Id