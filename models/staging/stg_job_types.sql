{{ config(materialized='view') }}

SELECT DISTINCT
  employment_type
FROM {{ ref('stg_job_postings') }}
WHERE employment_type IS NOT NULL
