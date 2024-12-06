{{ config(materialized='view') }}

WITH exploded AS (
  SELECT DISTINCT skill.value::string AS skill
  FROM {{ ref('stg_job_postings') }},
       LATERAL FLATTEN(input => skills) skill
  WHERE skill.value IS NOT NULL
)

SELECT DISTINCT skill FROM exploded
