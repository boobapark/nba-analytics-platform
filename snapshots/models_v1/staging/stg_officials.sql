with source as (

    select *
    from {{ source('nba', 'OFFICIALS') }}

),

renamed as (

    select

        game_id,

        try_to_number(official_id) as official_id,

        first_name,

        last_name,

        jersey_num as jersey_number

    from source

)

select *
from renamed