SELECT
    Id,
    AVG(VALUE) AS mean_heartrate,
    COUNT(Id) AS num_records
FROM heartrate_seconds
GROUP BY Id