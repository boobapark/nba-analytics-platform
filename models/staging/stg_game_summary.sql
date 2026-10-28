with source as (

    select *
    from {{ source('nba', 'GAME_SUMMARY') }}

),

renamed as (

    select

        game_id,

        try_to_date(game_date_est) as game_date,

        try_to_number(game_sequence) as game_sequence,

        try_to_number(game_status_id) as game_status_id,

        game_status_text as game_status,

        gamecode as game_code,

        try_to_number(home_team_id) as home_team_id,

        try_to_number(visitor_team_id) as away_team_id,

        try_to_number(season) as season,

        try_to_number(live_period) as live_period,

        live_pc_time,

        natl_tv_broadcaster_abbreviation as national_tv_broadcaster,

        live_period_time_bcast as live_period_time_broadcast,

        try_to_number(wh_status) as wh_status

    from source

)

select *
from renamed