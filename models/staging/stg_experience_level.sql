{{ config(materialized='view') }}

SELECT DISTINCT
  seniority_level
FROM {{ ref('stg_job_postings') }}
WHERE seniority_level IS NOT NULL AND seniority_level <> ''
