
  create or replace   view BASKETBALL_DEV.staging.stg_team
  
   as (
    with source as (

    select *
    from BASKETBALL_DEV.RAW.TEAM

),

renamed as (

    select

        try_to_number(id) as team_id,

        full_name as team_full_name,

        abbreviation as team_abbreviation,

        nickname as team_name,

        city,

        state,

        try_to_number(year_founded) as year_founded

    from source

)

select *
from renamed
  );

