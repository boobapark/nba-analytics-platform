
  create or replace   view BASKETBALL_DEV.marts.fact_draft_combine
  
   as (
    select

    player_id,

    season,

    height_wo_shoes,
    weight_lbs,

    wingspan,

    standing_reach,

    body_fat_pct,

    max_vertical_leap,

    three_quarter_sprint,

    height_category,

    is_elite_wingspan,

    is_elite_vertical_jump

from BASKETBALL_DEV.intermediate.int_draft_combine
  );

