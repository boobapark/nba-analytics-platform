with history as (

    select *
    from BASKETBALL_DEV.staging.stg_team_history

)

select

    team_id,

    city,
    team_name,

    valid_from_year,
    valid_to_year,

    valid_to_year - valid_from_year + 1
        as franchise_duration_years,

    valid_to_year = 2019
        as is_current_identity

from history