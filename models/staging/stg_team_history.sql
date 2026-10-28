with source as (

    select *
    from {{ source('nba', 'TEAM_HISTORY') }}

),

renamed as (

    select

        try_to_number(team_id) as team_id,

        city,

        nickname as team_name,

        try_to_number(year_founded) as valid_from_year,

        try_to_number(year_active_till) as valid_to_year

    from source

)

select *
from renamed