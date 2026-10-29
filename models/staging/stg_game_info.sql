with source as (
    select * from {{ source('raw', 'game_info') }}
)
select distinct
    {{ clean_value('game_id') }} as game_id,
    {{ safe_date('game_date') }} as game_date,
    {{ safe_integer('attendance') }} as attendance,
    {{ clean_value('game_time') }} as game_duration
from source
where {{ clean_value('game_id') }} is not null
