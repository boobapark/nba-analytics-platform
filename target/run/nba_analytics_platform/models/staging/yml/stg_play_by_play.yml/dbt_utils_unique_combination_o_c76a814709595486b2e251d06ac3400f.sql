select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        game_id, event_number
    from BASKETBALL_DEV.RAW.stg_play_by_play
    group by game_id, event_number
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test