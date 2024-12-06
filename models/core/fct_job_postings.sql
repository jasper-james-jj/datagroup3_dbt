{{ config(materialized='table') }}

WITH base AS (
  SELECT
    j.job_url,
    c.company_key,
    l.location_key,
    jt.job_type_key,
    el.experience_level_key,
    j.posted_time,
    j.expire_time,
    j.applies,
    j.reposted,
    j.apply_url
  FROM {{ ref('stg_job_postings') }} j
  LEFT JOIN {{ ref('dim_companies') }} c ON j.company_id = c.company_id
  LEFT JOIN {{ ref('dim_locations') }} l ON MD5(j.location)=l.location_key
  LEFT JOIN {{ ref('dim_job_types') }} jt ON MD5(j.employment_type)=jt.job_type_key
  LEFT JOIN {{ ref('dim_experience_level') }} el ON MD5(j.seniority_level)=el.experience_level_key
)

SELECT * FROM base
