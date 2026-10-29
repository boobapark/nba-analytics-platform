with source as (
    select * from {{ source('raw', 'officials') }}
)
select distinct
    {{ clean_value('game_id') }} as game_id,
    {{ clean_value('official_id') }} as official_id,
    {{ clean_value('first_name') }} as first_name,
    {{ clean_value('last_name') }} as last_name,
    {{ clean_value('jersey_num') }} as jersey_number
from source
where {{ clean_value('game_id') }} is not null
  and {{ clean_value('official_id') }} is not null
