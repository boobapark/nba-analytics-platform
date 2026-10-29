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

from {{ ref('int_draft_combine') }}