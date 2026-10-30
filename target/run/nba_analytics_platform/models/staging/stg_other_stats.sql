
  create or replace   view BASKETBALL_DEV.staging.stg_other_stats
  
   as (
    with source as (
    select * from BASKETBALL_DEV.RAW.other_stats
)
select distinct
    nullif(trim(cast(game_id as varchar)), '') as game_id,
    try_cast(nullif(trim(cast(team_id_home as varchar)), '') as bigint) as home_team_id,
    try_cast(nullif(trim(cast(team_id_away as varchar)), '') as bigint) as away_team_id,
    try_cast(nullif(trim(cast(pts_paint_home as varchar)), '') as bigint) as home_points_in_paint,
    try_cast(nullif(trim(cast(pts_2nd_chance_home as varchar)), '') as bigint) as home_second_chance_points,
    try_cast(nullif(trim(cast(pts_fb_home as varchar)), '') as bigint) as home_fast_break_points,
    try_cast(nullif(trim(cast(largest_lead_home as varchar)), '') as bigint) as home_largest_lead,
    try_cast(nullif(trim(cast(lead_changes as varchar)), '') as bigint) as lead_changes,
    try_cast(nullif(trim(cast(times_tied as varchar)), '') as bigint) as times_tied,
    try_cast(nullif(trim(cast(team_turnovers_home as varchar)), '') as bigint) as home_team_turnovers,
    try_cast(nullif(trim(cast(total_turnovers_home as varchar)), '') as bigint) as home_total_turnovers,
    try_cast(nullif(trim(cast(team_rebounds_home as varchar)), '') as bigint) as home_team_rebounds,
    try_cast(nullif(trim(cast(pts_off_to_home as varchar)), '') as bigint) as home_points_off_turnovers,
    try_cast(nullif(trim(cast(pts_paint_away as varchar)), '') as bigint) as away_points_in_paint,
    try_cast(nullif(trim(cast(pts_2nd_chance_away as varchar)), '') as bigint) as away_second_chance_points,
    try_cast(nullif(trim(cast(pts_fb_away as varchar)), '') as bigint) as away_fast_break_points,
    try_cast(nullif(trim(cast(largest_lead_away as varchar)), '') as bigint) as away_largest_lead,
    try_cast(nullif(trim(cast(team_turnovers_away as varchar)), '') as bigint) as away_team_turnovers,
    try_cast(nullif(trim(cast(total_turnovers_away as varchar)), '') as bigint) as away_total_turnovers,
    try_cast(nullif(trim(cast(team_rebounds_away as varchar)), '') as bigint) as away_team_rebounds,
    try_cast(nullif(trim(cast(pts_off_to_away as varchar)), '') as bigint) as away_points_off_turnovers
from source
where nullif(trim(cast(game_id as varchar)), '') is not null
  );

