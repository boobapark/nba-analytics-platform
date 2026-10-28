select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      





with validation_errors as (

    select
        team_id, valid_from_year
    from BASKETBALL_DEV.RAW.stg_team_history
    group by team_id, valid_from_year
    having count(*) > 1

)

select *
from validation_errors



      
    ) dbt_internal_test