with source as (

    select *
    from BASKETBALL_DEV.staging.stg_play_by_play

)

select

    *,

    case
        when event_type = 1 then 'MADE_SHOT'
        when event_type = 2 then 'MISSED_SHOT'
        when event_type = 3 then 'FREE_THROW'
        when event_type = 4 then 'REBOUND'
        when event_type = 5 then 'TURNOVER'
        when event_type = 6 then 'FOUL'
        when event_type = 8 then 'SUBSTITUTION'
        when event_type = 9 then 'TIMEOUT'
        else 'OTHER'
    end as event_category,

    event_type = 1 as is_made_shot,
    event_type = 2 as is_missed_shot,
    event_type = 3 as is_free_throw,
    event_type = 4 as is_rebound,
    event_type = 5 as is_turnover,
    event_type = 6 as is_foul,
    event_type = 8 as is_substitution,
    event_type = 9 as is_timeout

from source