select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select is_active
from BASKETBALL_DEV.RAW.stg_player
where is_active is null



      
    ) dbt_internal_test