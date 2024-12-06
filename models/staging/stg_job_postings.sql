{{ config(materialized='view') }}

SELECT
  raw_record:title::string AS title,
  raw_record:company::string AS company_name,
  raw_record:location::string AS location,
  raw_record:company_id::string AS company_id,
  raw_record:employment_type::string AS employment_type,
  raw_record:seniority_level::string AS seniority_level,
  raw_record:industries::array AS industries,
  raw_record:job_functions::array AS job_functions,
  raw_record:applies::int AS applies,
  raw_record:workplace_type::string AS workplace_type,
  raw_record:skills::array AS skills,
  raw_record:job_url::string AS job_url,
  raw_record:reposted::boolean AS reposted,
  raw_record:posted_time::timestamp AS posted_time,
  raw_record:expire_time::timestamp AS expire_time,
  raw_record:apply_url::string AS apply_url
FROM {{ source('raw_data', 'raw_jobs_data') }}