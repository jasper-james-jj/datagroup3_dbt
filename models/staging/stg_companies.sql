{{ config(materialized='view') }}

SELECT DISTINCT
  company_id,
  company_name
FROM {{ ref('stg_job_postings') }}
WHERE company_id IS NOT NULL
