with source as (

    select *
    from BASKETBALL_DEV.RAW.DRAFT_HISTORY

),

renamed as (

    select

        try_to_number(person_id) as player_id,

        player_name as full_name,

        try_to_number(season) as season,

        try_to_number(round_number) as draft_round,

        try_to_number(round_pick) as round_pick,

        try_to_number(overall_pick) as draft_pick_number,

        draft_type,

        try_to_number(team_id) as team_id,

        team_city,

        team_name,

        team_abbreviation,

        organization,

        organization_type,

        case
            when player_profile_flag = '1' then true
            when player_profile_flag = '0' then false
            else null
        end as player_profile_flag

    from source

)

select *
from renamed