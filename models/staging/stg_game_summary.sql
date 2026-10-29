with source as (
    select * from {{ source('raw', 'game_summary') }}
)
select distinct
    {{ clean_value('game_id') }} as game_id,
    {{ safe_date('game_date_est') }} as game_date,
    {{ safe_integer('game_sequence') }} as game_sequence,
    {{ safe_integer('game_status_id') }} as game_status_id,
    {{ clean_value('game_status_text') }} as game_status,
    {{ clean_value('gamecode') }} as game_code,
    {{ safe_integer('home_team_id') }} as home_team_id,
    {{ safe_integer('visitor_team_id') }} as away_team_id,
    {{ safe_integer('season') }} as season_year,
    {{ safe_integer('live_period') }} as live_period,
    {{ clean_value('natl_tv_broadcaster_abbreviation') }} as tv_broadcaster
from source
where {{ clean_value('game_id') }} is not null
