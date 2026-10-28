
  create or replace   view BASKETBALL_DEV.RAW_staging.stg_team_details
  
   as (
    with source as (

    select *
    from BASKETBALL_DEV.RAW.TEAM_DETAILS

),

renamed as (

    select

        try_to_number(team_id) as team_id,

        abbreviation as team_abbreviation,

        nickname as team_name,

        try_to_number(yearfounded) as year_founded,

        city,

        arena,

        try_to_number(arenacapacity) as arena_capacity,

        owner,

        generalmanager as general_manager,

        headcoach as head_coach,

        dleagueaffiliation as g_league_affiliate,

        facebook as facebook_url,
        instagram as instagram_url,
        twitter as twitter_url

    from source

)

select *
from renamed
  );

