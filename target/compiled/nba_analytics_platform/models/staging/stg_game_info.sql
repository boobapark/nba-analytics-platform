with source as (
    select * from BASKETBALL_DEV.RAW.game_info
)
select distinct
    nullif(trim(cast(game_id as varchar)), '') as game_id,
    try_cast(nullif(trim(cast(game_date as varchar)), '') as date) as game_date,
    try_cast(nullif(trim(cast(attendance as varchar)), '') as bigint) as attendance,
    nullif(trim(cast(game_time as varchar)), '') as game_duration
from source
where nullif(trim(cast(game_id as varchar)), '') is not null