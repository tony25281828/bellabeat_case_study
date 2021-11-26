--GET TIME TO SLEEP EVERYDAY FOR EACH ID
SELECT 
    Id,
    --MSSQL does not have EXTRACT()
    CAST(date AS date) AS date2,
    MIN(date) AS time_to_sleep
FROM minuteSleep
--MSSQL does not support direct use of new column name
GROUP BY Id, CAST(date AS date)
ORDER BY Id, date2