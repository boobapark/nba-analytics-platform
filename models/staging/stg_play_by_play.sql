with source as (
    select * from {{ source('raw', 'play_by_play') }}
)
select
    {{ clean_value('game_id') }} as game_id,
    {{ safe_integer('eventnum') }} as event_number,
    {{ safe_integer('eventmsgtype') }} as event_type_id,
    {{ safe_integer('eventmsgactiontype') }} as event_action_type_id,
    {{ safe_integer('period') }} as period_number,
    {{ clean_value('wctimestring') }} as game_clock,
    {{ clean_value('pctimestring') }} as period_clock,
    {{ clean_value('homedescription') }} as home_description,
    {{ clean_value('neutraldescription') }} as neutral_description,
    {{ clean_value('visitordescription') }} as away_description,
    {{ clean_value('score') }} as score_text,
    {{ safe_integer('scoremargin') }} as score_margin,
    {{ clean_value('player1_id') }} as player1_id,
    {{ clean_value('player1_name') }} as player1_name,
    {{ safe_integer('player1_team_id') }} as player1_team_id,
    {{ clean_value('player2_id') }} as player2_id,
    {{ clean_value('player2_name') }} as player2_name,
    {{ safe_integer('player2_team_id') }} as player2_team_id,
    {{ clean_value('player3_id') }} as player3_id,
    {{ clean_value('player3_name') }} as player3_name,
    {{ safe_integer('player3_team_id') }} as player3_team_id,
    {{ safe_boolean('video_available_flag') }} as video_available
from source
where {{ clean_value('game_id') }} is not null
  and {{ safe_integer('eventnum') }} is not null
