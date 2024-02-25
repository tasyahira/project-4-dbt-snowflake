{{
    config(
        schema='stg'
    )
}}

SELECT
    DATE_TRUNC(year,DATEADD(year,-1,CURRENT_DATE())) AS ref_timestamp,
    LAST_DAY(DATEADD(week,2 + CAST(WEEKISO(ref_timestamp) != 1 AS INTEGER),ref_timestamp),week) AS end_week,
    DATEADD(day, day_num - 7, end_week) AS date_valid_std
FROM
(   
    SELECT
        ROW_NUMBER() OVER (ORDER BY SEQ1()) AS day_num
    FROM
        TABLE(GENERATOR(rowcount => 7))
)