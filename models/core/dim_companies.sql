{{ config(materialized='table') }}

SELECT DISTINCT
  company_id,
  company_name,
  MD5(company_name) AS company_key
FROM {{ ref('stg_jobs') }}
WHERE company_name IS NOT NULL
