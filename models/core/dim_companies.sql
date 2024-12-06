{{ config(materialized='table') }}

SELECT
  company_id,
  company_name,
  MD5(company_name) AS company_key
FROM {{ ref('stg_companies') }}
