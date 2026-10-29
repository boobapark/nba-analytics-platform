with source as (

    select *
    from {{ source('nba', 'COMMON_PLAYER_INFO') }}

),

renamed as (

    select

        try_to_number(person_id) as player_id,

        first_name,

        last_name,

        display_first_last as full_name,

        player_slug,

        try_to_date(birthdate) as birth_date,

        school,

        country,

        height,

        try_to_number(weight) as weight_lbs,

        position,

        lower(rosterstatus) as roster_status,

        try_to_number(team_id) as team_id,

        team_name,

        team_abbreviation,

        team_city,

        try_to_number(from_year) as first_season_year,

        try_to_number(to_year) as last_season_year,

        case
            when draft_year = 'Undrafted' then null
            else try_to_number(draft_year)
        end as draft_year,

        case
            when draft_round = 'Undrafted' then null
            else try_to_number(draft_round)
        end as draft_round,

        case
            when draft_number = 'Undrafted' then null
            else try_to_number(draft_number)
        end as draft_pick_number,

        greatest_75_flag

    from source

)

select *
from renamed