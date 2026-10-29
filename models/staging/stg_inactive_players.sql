with source as (
    select * from {{ source('raw', 'inactive_players') }}
)
select distinct
    {{ clean_value('game_id') }} as game_id,
    {{ clean_value('player_id') }} as player_id,
    {{ clean_value('first_name') }} as first_name,
    {{ clean_value('last_name') }} as last_name,
    {{ clean_value('jersey_num') }} as jersey_number,
    {{ safe_integer('team_id') }} as team_id,
    {{ clean_value('team_city') }} as team_city,
    {{ clean_value('team_name') }} as team_name,
    {{ clean_value('team_abbreviation') }} as team_abbreviation
from source
where {{ clean_value('game_id') }} is not null
  and {{ clean_value('player_id') }} is not null
