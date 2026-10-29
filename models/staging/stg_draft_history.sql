with source as (
    select * from {{ source('raw', 'draft_history') }}
)
select distinct
    {{ clean_value('person_id') }} as player_id,
    {{ clean_value('player_name') }} as player_name,
    {{ safe_integer('season') }} as draft_year,
    {{ safe_integer('round_number') }} as draft_round,
    {{ safe_integer('round_pick') }} as round_pick,
    {{ safe_integer('overall_pick') }} as overall_pick,
    {{ clean_value('draft_type') }} as draft_type,
    {{ safe_integer('team_id') }} as team_id,
    {{ clean_value('team_city') }} as team_city,
    {{ clean_value('team_name') }} as team_name,
    {{ clean_value('team_abbreviation') }} as team_abbreviation,
    {{ clean_value('organization') }} as organization,
    {{ clean_value('organization_type') }} as organization_type
from source
where {{ clean_value('person_id') }} is not null
