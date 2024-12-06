{{ config(materialized='table') }}

SELECT
  employment_type,
  MD5(employment_type) as job_type_key
FROM {{ ref('stg_job_types') }}