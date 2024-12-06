{{ config(materialized='table') }}

SELECT
  seniority_level,
  MD5(seniority_level) as experience_level_key
FROM {{ ref('stg_experience_level') }}
