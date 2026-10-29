with source as (

    select *
    from {{ source('nba', 'INACTIVE_PLAYERS') }}

),

renamed as (

    select

        game_id,

        try_to_number(player_id) as player_id,

        first_name,

        last_name,

        jersey_num as jersey_number,

        try_to_number(team_id) as team_id,

        team_city,

        team_name,

        team_abbreviation

    from source

)

select *
from renamed