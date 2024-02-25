{{
    config(
        schema='stg'
    )
}}

SELECT
    country,
    postal_code,
    date_valid_std,
    tot_snowfall_in 
FROM 
    {{ ref('raw_historical_day') }}
NATURAL INNER JOIN
    {{ ref('timestamp_helpers') }}
WHERE
    country='US' AND
    tot_snowfall_in > 6.0 
ORDER BY 
    postal_code,date_valid_std