





with validation_errors as (

    select
        game_id, event_number
    from BASKETBALL_DEV.RAW.stg_play_by_play
    group by game_id, event_number
    having count(*) > 1

)

select *
from validation_errors


