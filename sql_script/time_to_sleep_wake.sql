WITH time_to_sleep AS (
    --GET TIME TO SLEEP EVERYDAY FOR EACH ID
    SELECT 
        Id,
        --MSSQL does not have EXTRACT()
        CAST(date AS date) AS date_stats,
        MIN(date) AS time_to_sleep
    FROM minuteSleep
    --MSSQL does not support direct use of new column name
    GROUP BY Id, CAST(date AS date)
    )


--GET TIME TO SLEEP AND TIME TO WAKE EVERYDAY FOR EACH ID
SELECT
    TTS.Id,
    TTS.date_stats,
    CAST(TTS.time_to_sleep AS TIME) AS time_to_bed,
    SD.TotalTimeInBed,
    --MSSQL does not have TIME_ADD() but can use DATEADD
    DATEADD(MINUTE, SD.TotalTimeInBed, CAST(TTS.time_to_sleep AS TIME)) AS time_to_wake
FROM sleepDay AS SD
FULL JOIN time_to_sleep AS TTS
ON 
    SD.Id = TTS.Id AND
    SD.SleepDay = TTS.date_stats
GROUP BY 
    TTS.Id, TTS.date_stats, TTS.time_to_sleep, SD.TotalTimeInBed
ORDER BY 
    TTS.Id, TTS.date_stats ASC