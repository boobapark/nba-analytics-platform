with source as (
    select * from BASKETBALL_DEV.RAW.inactive_players
)
select distinct
    nullif(trim(cast(game_id as varchar)), '') as game_id,
    nullif(trim(cast(player_id as varchar)), '') as player_id,
    nullif(trim(cast(first_name as varchar)), '') as first_name,
    nullif(trim(cast(last_name as varchar)), '') as last_name,
    nullif(trim(cast(jersey_num as varchar)), '') as jersey_number,
    try_cast(nullif(trim(cast(team_id as varchar)), '') as bigint) as team_id,
    nullif(trim(cast(team_city as varchar)), '') as team_city,
    nullif(trim(cast(team_name as varchar)), '') as team_name,
    nullif(trim(cast(team_abbreviation as varchar)), '') as team_abbreviation
from source
where nullif(trim(cast(game_id as varchar)), '') is not null
  and nullif(trim(cast(player_id as varchar)), '') is not null