with source as (
    select * from BASKETBALL_DEV.RAW.draft_history
)
select distinct
    nullif(trim(cast(person_id as varchar)), '') as player_id,
    nullif(trim(cast(player_name as varchar)), '') as player_name,
    try_cast(nullif(trim(cast(season as varchar)), '') as bigint) as draft_year,
    try_cast(nullif(trim(cast(round_number as varchar)), '') as bigint) as draft_round,
    try_cast(nullif(trim(cast(round_pick as varchar)), '') as bigint) as round_pick,
    try_cast(nullif(trim(cast(overall_pick as varchar)), '') as bigint) as overall_pick,
    nullif(trim(cast(draft_type as varchar)), '') as draft_type,
    try_cast(nullif(trim(cast(team_id as varchar)), '') as bigint) as team_id,
    nullif(trim(cast(team_city as varchar)), '') as team_city,
    nullif(trim(cast(team_name as varchar)), '') as team_name,
    nullif(trim(cast(team_abbreviation as varchar)), '') as team_abbreviation,
    nullif(trim(cast(organization as varchar)), '') as organization,
    nullif(trim(cast(organization_type as varchar)), '') as organization_type
from source
where nullif(trim(cast(person_id as varchar)), '') is not null