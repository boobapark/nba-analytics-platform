
  create or replace   view BASKETBALL_DEV.staging.stg_team_history
  
   as (
    with source as (
    select * from BASKETBALL_DEV.RAW.team_history
)
select distinct
    try_cast(nullif(trim(cast(team_id as varchar)), '') as bigint) as team_id,
    nullif(trim(cast(city as varchar)), '') as team_city,
    nullif(trim(cast(nickname as varchar)), '') as team_nickname,
    try_cast(nullif(trim(cast(year_founded as varchar)), '') as bigint) as valid_from_year,
    try_cast(nullif(trim(cast(year_active_till as varchar)), '') as bigint) as valid_to_year
from source
where nullif(trim(cast(team_id as varchar)), '') is not null
  );

