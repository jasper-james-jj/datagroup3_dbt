{{ config(materialized='table') }}

WITH base AS (
  SELECT
    j.job_url,
    c.company_key,
    j.posted_time,
    j.expire_time,
    j.applies,
    j.reposted,
    j.apply_url
  FROM {{ ref('stg_jobs') }} j
  LEFT JOIN {{ ref('dim_companies') }} c
    ON j.company_id = c.company_id
)

SELECT * FROM base
