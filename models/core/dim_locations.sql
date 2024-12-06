{{ config(materialized='table') }}

WITH base AS (
  SELECT DISTINCT location
  FROM {{ ref('stg_locations') }}
  WHERE location IS NOT NULL
),
parsed AS (
  SELECT
    location,
    SPLIT_PART(location, ',', 1) AS city,
    SPLIT_PART(location, ',', 2) AS state_province,
    SPLIT_PART(location, ',', 3) AS country
  FROM base
)

SELECT
  location,
  city,
  state_province,
  country,
  MD5(location) AS location_key
FROM parsed