
  create or replace   view BASKETBALL_DEV.RAW_staging.stg_game_info
  
   as (
    with source as (

    select *
    from BASKETBALL_DEV.RAW.GAME_INFO

),

renamed as (

    select

        game_id,

        try_to_date(game_date) as game_date,

        try_to_number(attendance) as attendance,

        game_time as game_duration

    from source

)

select *
from renamed
  );

