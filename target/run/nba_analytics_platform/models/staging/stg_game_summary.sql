
  create or replace   view BASKETBALL_DEV.staging.stg_game_summary
  
   as (
    with source as (
    select * from BASKETBALL_DEV.RAW.game_summary
)
select distinct
    nullif(trim(cast(game_id as varchar)), '') as game_id,
    try_cast(nullif(trim(cast(game_date_est as varchar)), '') as date) as game_date,
    try_cast(nullif(trim(cast(game_sequence as varchar)), '') as bigint) as game_sequence,
    try_cast(nullif(trim(cast(game_status_id as varchar)), '') as bigint) as game_status_id,
    nullif(trim(cast(game_status_text as varchar)), '') as game_status,
    nullif(trim(cast(gamecode as varchar)), '') as game_code,
    try_cast(nullif(trim(cast(home_team_id as varchar)), '') as bigint) as home_team_id,
    try_cast(nullif(trim(cast(visitor_team_id as varchar)), '') as bigint) as away_team_id,
    try_cast(nullif(trim(cast(season as varchar)), '') as bigint) as season_year,
    try_cast(nullif(trim(cast(live_period as varchar)), '') as bigint) as live_period,
    nullif(trim(cast(natl_tv_broadcaster_abbreviation as varchar)), '') as tv_broadcaster
from source
where nullif(trim(cast(game_id as varchar)), '') is not null
  );

