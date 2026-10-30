with source as (
    select * from BASKETBALL_DEV.RAW.team_details
)
select distinct
    try_cast(nullif(trim(cast(team_id as varchar)), '') as bigint) as team_id,
    nullif(trim(cast(abbreviation as varchar)), '') as team_abbreviation,
    nullif(trim(cast(nickname as varchar)), '') as team_nickname,
    try_cast(nullif(trim(cast(yearfounded as varchar)), '') as bigint) as year_founded,
    nullif(trim(cast(city as varchar)), '') as team_city,
    nullif(trim(cast(arena as varchar)), '') as arena,
    try_cast(nullif(trim(cast(arenacapacity as varchar)), '') as bigint) as arena_capacity,
    nullif(trim(cast(owner as varchar)), '') as owner_name,
    nullif(trim(cast(generalmanager as varchar)), '') as general_manager,
    nullif(trim(cast(headcoach as varchar)), '') as head_coach,
    nullif(trim(cast(dleagueaffiliation as varchar)), '') as g_league_affiliation
from source
where nullif(trim(cast(team_id as varchar)), '') is not null