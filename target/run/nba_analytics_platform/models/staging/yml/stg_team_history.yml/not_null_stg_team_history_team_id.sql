select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select team_id
from BASKETBALL_DEV.RAW.stg_team_history
where team_id is null



      
    ) dbt_internal_test