{{ config(materialized='view') }}

SELECT DISTINCT
  location
FROM {{ ref('stg_job_postings') }}
WHERE location IS NOT NULL
