with source as (
    select * from {{ source('raw', 'draft_combine_stats') }}
)
select distinct
    {{ clean_value('player_id') }} as player_id,
    {{ safe_integer('season') }} as draft_year,
    {{ clean_value('player_name') }} as player_name,
    {{ clean_value('position') }} as position,
    {{ safe_decimal('height_wo_shoes') }} as height_no_shoes_inches,
    {{ safe_decimal('height_w_shoes') }} as height_with_shoes_inches,
    {{ safe_decimal('weight') }} as weight_lbs,
    {{ safe_decimal('wingspan') }} as wingspan_inches,
    {{ safe_decimal('standing_reach') }} as standing_reach_inches,
    {{ safe_decimal('body_fat_pct') }} as body_fat_pct,
    {{ safe_decimal('hand_length') }} as hand_length_inches,
    {{ safe_decimal('hand_width') }} as hand_width_inches,
    {{ safe_decimal('standing_vertical_leap') }} as standing_vertical_leap_inches,
    {{ safe_decimal('max_vertical_leap') }} as max_vertical_leap_inches,
    {{ safe_decimal('lane_agility_time') }} as lane_agility_seconds,
    {{ safe_decimal('modified_lane_agility_time') }} as modified_lane_agility_seconds,
    {{ safe_decimal('three_quarter_sprint') }} as sprint_seconds,
    {{ safe_decimal('bench_press') }} as bench_press_repetitions
from source
where {{ clean_value('player_id') }} is not null
