{{ config(materialized='table') }}

WITH exploded AS (
  SELECT
    j.job_url,
    skill.value::string as skill
  FROM {{ ref('stg_job_postings') }} j,
       LATERAL FLATTEN(input => j.skills) skill
  WHERE skill.value IS NOT NULL
)

SELECT
  e.job_url,
  s.skill_key
FROM exploded e
JOIN {{ ref('dim_job_skills') }} s ON e.skill = s.skill
