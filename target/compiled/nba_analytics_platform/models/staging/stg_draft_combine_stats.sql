with source as (
    select * from BASKETBALL_DEV.RAW.draft_combine_stats
)
select distinct
    nullif(trim(cast(player_id as varchar)), '') as player_id,
    try_cast(nullif(trim(cast(season as varchar)), '') as bigint) as draft_year,
    nullif(trim(cast(player_name as varchar)), '') as player_name,
    nullif(trim(cast(position as varchar)), '') as position,
    try_cast(nullif(trim(cast(height_wo_shoes as varchar)), '') as double) as height_no_shoes_inches,
    try_cast(nullif(trim(cast(height_w_shoes as varchar)), '') as double) as height_with_shoes_inches,
    try_cast(nullif(trim(cast(weight as varchar)), '') as double) as weight_lbs,
    try_cast(nullif(trim(cast(wingspan as varchar)), '') as double) as wingspan_inches,
    try_cast(nullif(trim(cast(standing_reach as varchar)), '') as double) as standing_reach_inches,
    try_cast(nullif(trim(cast(body_fat_pct as varchar)), '') as double) as body_fat_pct,
    try_cast(nullif(trim(cast(hand_length as varchar)), '') as double) as hand_length_inches,
    try_cast(nullif(trim(cast(hand_width as varchar)), '') as double) as hand_width_inches,
    try_cast(nullif(trim(cast(standing_vertical_leap as varchar)), '') as double) as standing_vertical_leap_inches,
    try_cast(nullif(trim(cast(max_vertical_leap as varchar)), '') as double) as max_vertical_leap_inches,
    try_cast(nullif(trim(cast(lane_agility_time as varchar)), '') as double) as lane_agility_seconds,
    try_cast(nullif(trim(cast(modified_lane_agility_time as varchar)), '') as double) as modified_lane_agility_seconds,
    try_cast(nullif(trim(cast(three_quarter_sprint as varchar)), '') as double) as sprint_seconds,
    try_cast(nullif(trim(cast(bench_press as varchar)), '') as double) as bench_press_repetitions
from source
where nullif(trim(cast(player_id as varchar)), '') is not null