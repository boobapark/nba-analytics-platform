with source as (
    select * from {{ source('raw', 'team_details') }}
)
select distinct
    {{ safe_integer('team_id') }} as team_id,
    {{ clean_value('abbreviation') }} as team_abbreviation,
    {{ clean_value('nickname') }} as team_nickname,
    {{ safe_integer('yearfounded') }} as year_founded,
    {{ clean_value('city') }} as team_city,
    {{ clean_value('arena') }} as arena,
    {{ safe_integer('arenacapacity') }} as arena_capacity,
    {{ clean_value('owner') }} as owner_name,
    {{ clean_value('generalmanager') }} as general_manager,
    {{ clean_value('headcoach') }} as head_coach,
    {{ clean_value('dleagueaffiliation') }} as g_league_affiliation
from source
where {{ clean_value('team_id') }} is not null
