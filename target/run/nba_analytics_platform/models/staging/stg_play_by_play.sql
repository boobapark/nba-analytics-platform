
  create or replace   view BASKETBALL_DEV.staging.stg_play_by_play
  
   as (
    with source as (
    select * from BASKETBALL_DEV.RAW.play_by_play
)
select
    nullif(trim(cast(game_id as varchar)), '') as game_id,
    try_cast(nullif(trim(cast(eventnum as varchar)), '') as bigint) as event_number,
    try_cast(nullif(trim(cast(eventmsgtype as varchar)), '') as bigint) as event_type_id,
    try_cast(nullif(trim(cast(eventmsgactiontype as varchar)), '') as bigint) as event_action_type_id,
    try_cast(nullif(trim(cast(period as varchar)), '') as bigint) as period_number,
    nullif(trim(cast(wctimestring as varchar)), '') as game_clock,
    nullif(trim(cast(pctimestring as varchar)), '') as period_clock,
    nullif(trim(cast(homedescription as varchar)), '') as home_description,
    nullif(trim(cast(neutraldescription as varchar)), '') as neutral_description,
    nullif(trim(cast(visitordescription as varchar)), '') as away_description,
    nullif(trim(cast(score as varchar)), '') as score_text,
    try_cast(nullif(trim(cast(scoremargin as varchar)), '') as bigint) as score_margin,
    nullif(trim(cast(player1_id as varchar)), '') as player1_id,
    nullif(trim(cast(player1_name as varchar)), '') as player1_name,
    try_cast(nullif(trim(cast(player1_team_id as varchar)), '') as bigint) as player1_team_id,
    nullif(trim(cast(player2_id as varchar)), '') as player2_id,
    nullif(trim(cast(player2_name as varchar)), '') as player2_name,
    try_cast(nullif(trim(cast(player2_team_id as varchar)), '') as bigint) as player2_team_id,
    nullif(trim(cast(player3_id as varchar)), '') as player3_id,
    nullif(trim(cast(player3_name as varchar)), '') as player3_name,
    try_cast(nullif(trim(cast(player3_team_id as varchar)), '') as bigint) as player3_team_id,
    case
    when lower(nullif(trim(cast(video_available_flag as varchar)), '')) in ('true', '1', 'yes', 'y') then true
    when lower(nullif(trim(cast(video_available_flag as varchar)), '')) in ('false', '0', 'no', 'n') then false
    else null
end as video_available
from source
where nullif(trim(cast(game_id as varchar)), '') is not null
  and try_cast(nullif(trim(cast(eventnum as varchar)), '') as bigint) is not null
  );

