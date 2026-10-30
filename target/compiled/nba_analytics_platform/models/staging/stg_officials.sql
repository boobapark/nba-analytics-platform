with source as (
    select * from BASKETBALL_DEV.RAW.officials
)
select distinct
    nullif(trim(cast(game_id as varchar)), '') as game_id,
    nullif(trim(cast(official_id as varchar)), '') as official_id,
    nullif(trim(cast(first_name as varchar)), '') as first_name,
    nullif(trim(cast(last_name as varchar)), '') as last_name,
    nullif(trim(cast(jersey_num as varchar)), '') as jersey_number
from source
where nullif(trim(cast(game_id as varchar)), '') is not null
  and nullif(trim(cast(official_id as varchar)), '') is not null