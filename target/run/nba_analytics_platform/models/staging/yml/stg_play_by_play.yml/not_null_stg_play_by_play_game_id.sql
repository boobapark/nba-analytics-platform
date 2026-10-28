select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select game_id
from BASKETBALL_DEV.RAW.stg_play_by_play
where game_id is null



      
    ) dbt_internal_test