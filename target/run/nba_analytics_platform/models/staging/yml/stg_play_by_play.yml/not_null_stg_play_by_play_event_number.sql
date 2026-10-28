select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select event_number
from BASKETBALL_DEV.RAW.stg_play_by_play
where event_number is null



      
    ) dbt_internal_test