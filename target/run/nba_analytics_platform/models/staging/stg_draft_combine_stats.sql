
  create or replace   view BASKETBALL_DEV.RAW_staging.stg_draft_combine_stats
  
   as (
    with source as (

    select *
    from BASKETBALL_DEV.RAW.DRAFT_COMBINE_STATS

),

renamed as (

    select

        try_to_number(season) as season,

        try_to_number(player_id) as player_id,

        first_name,
        last_name,
        player_name,

        position,

        try_to_decimal(height_wo_shoes, 10, 2) as height_wo_shoes,
        height_wo_shoes_ft_in,

        try_to_decimal(height_w_shoes, 10, 2) as height_w_shoes,
        height_w_shoes_ft_in,

        try_to_decimal(weight, 10, 2) as weight_lbs,

        try_to_decimal(wingspan, 10, 2) as wingspan,
        wingspan_ft_in,

        try_to_decimal(standing_reach, 10, 2) as standing_reach,
        standing_reach_ft_in,

        try_to_decimal(body_fat_pct, 10, 2) as body_fat_pct,

        try_to_decimal(hand_length, 10, 2) as hand_length,
        try_to_decimal(hand_width, 10, 2) as hand_width,

        try_to_decimal(standing_vertical_leap, 10, 2) as standing_vertical_leap,
        try_to_decimal(max_vertical_leap, 10, 2) as max_vertical_leap,

        try_to_decimal(lane_agility_time, 10, 2) as lane_agility_time,
        try_to_decimal(modified_lane_agility_time, 10, 2) as modified_lane_agility_time,

        try_to_decimal(three_quarter_sprint, 10, 2) as three_quarter_sprint,

        try_to_number(bench_press) as bench_press,

        spot_fifteen_corner_left,
        spot_fifteen_break_left,
        spot_fifteen_top_key,
        spot_fifteen_break_right,
        spot_fifteen_corner_right,

        spot_college_corner_left,
        spot_college_break_left,
        spot_college_top_key,
        spot_college_break_right,
        spot_college_corner_right,

        spot_nba_corner_left,
        spot_nba_break_left,
        spot_nba_top_key,
        spot_nba_break_right,
        spot_nba_corner_right,

        off_drib_fifteen_break_left,
        off_drib_fifteen_top_key,
        off_drib_fifteen_break_right,

        off_drib_college_break_left,
        off_drib_college_top_key,
        off_drib_college_break_right,

        on_move_fifteen,
        on_move_college

    from source

)

select *
from renamed
  );

