with source as (
    select * from {{ source('raw', 'team_history') }}
)
select distinct
    {{ safe_integer('team_id') }} as team_id,
    {{ clean_value('city') }} as team_city,
    {{ clean_value('nickname') }} as team_nickname,
    {{ safe_integer('year_founded') }} as valid_from_year,
    {{ safe_integer('year_active_till') }} as valid_to_year
from source
where {{ clean_value('team_id') }} is not null
