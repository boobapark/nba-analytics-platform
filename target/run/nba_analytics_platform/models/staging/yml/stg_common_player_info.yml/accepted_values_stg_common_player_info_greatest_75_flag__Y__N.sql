select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        greatest_75_flag as value_field,
        count(*) as n_records

    from BASKETBALL_DEV.RAW.stg_common_player_info
    group by greatest_75_flag

)

select *
from all_values
where value_field not in (
    'Y','N'
)



      
    ) dbt_internal_test