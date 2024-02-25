{{
    config(
        schema='raw'
    )
}}

SELECT *
FROM {{ source('raw_data', 'history_day') }}