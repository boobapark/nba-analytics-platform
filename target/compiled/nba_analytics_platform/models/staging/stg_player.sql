with source as (

    select *
    from BASKETBALL_DEV.RAW.PLAYER

),

renamed as (

    select

        try_to_number(player_id) as player_id,

        full_name,

        first_name,

        last_name,

        case
            when is_active = '1' then true
            when is_active = '0' then false
            else null
        end as is_active

    from source

)

select *
from renamed