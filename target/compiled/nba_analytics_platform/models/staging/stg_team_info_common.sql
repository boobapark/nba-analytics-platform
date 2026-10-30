with source as (
    select * from BASKETBALL_DEV.RAW.team_info_common
)
select distinct
    try_cast(nullif(trim(cast(team_id as varchar)), '') as bigint) as team_id,
    nullif(trim(cast(season_year as varchar)), '') as season_year,
    nullif(trim(cast(team_city as varchar)), '') as team_city,
    nullif(trim(cast(team_name as varchar)), '') as team_name,
    nullif(trim(cast(team_abbreviation as varchar)), '') as team_abbreviation,
    nullif(trim(cast(team_conference as varchar)), '') as team_conference,
    nullif(trim(cast(team_division as varchar)), '') as team_division,
    try_cast(nullif(trim(cast(w as varchar)), '') as bigint) as wins,
    try_cast(nullif(trim(cast(l as varchar)), '') as bigint) as losses,
    try_cast(nullif(trim(cast(pct as varchar)), '') as double) as win_pct,
    try_cast(nullif(trim(cast(conf_rank as varchar)), '') as bigint) as conference_rank,
    try_cast(nullif(trim(cast(div_rank as varchar)), '') as bigint) as division_rank,
    try_cast(nullif(trim(cast(pts_pg as varchar)), '') as bigint) as points_per_game,
    try_cast(nullif(trim(cast(reb_pg as varchar)), '') as bigint) as rebounds_per_game,
    try_cast(nullif(trim(cast(ast_pg as varchar)), '') as bigint) as assists_per_game,
    try_cast(nullif(trim(cast(opp_pts_pg as varchar)), '') as bigint) as opponent_points_per_game
from source
where nullif(trim(cast(team_id as varchar)), '') is not null