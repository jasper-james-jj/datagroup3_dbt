{{ config(materialized='table') }}

SELECT
  skill,
  MD5(skill) AS skill_key
FROM {{ ref('stg_job_skills') }}
