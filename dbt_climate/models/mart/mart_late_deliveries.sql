{{
    config(
        materialized='table'
    )
}}

SELECT *
FROM {{ ref('stg_climate_history') }}
WHERE postal_code = '04290'