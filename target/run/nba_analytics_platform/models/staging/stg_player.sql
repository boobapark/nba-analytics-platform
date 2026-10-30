
  create or replace   view BASKETBALL_DEV.staging.stg_player
  
   as (
    with source as (

    select *
    from BASKETBALL_DEV.RAW.player

),

typed as (

    select
        nullif(trim(cast(player_id as varchar)), '') as player_id,
        nullif(trim(cast(full_name as varchar)), '') as full_name,
        nullif(trim(cast(first_name as varchar)), '') as first_name,
        nullif(trim(cast(last_name as varchar)), '') as last_name,
        case
    when lower(nullif(trim(cast(is_active as varchar)), '')) in ('true', '1', 'yes', 'y') then true
    when lower(nullif(trim(cast(is_active as varchar)), '')) in ('false', '0', 'no', 'n') then false
    else null
end as is_active
    from source

)

select distinct *
from typed
where player_id is not null
  );

