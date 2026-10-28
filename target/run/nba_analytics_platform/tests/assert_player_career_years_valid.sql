select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      select
    player_id,
    from_year,
    to_year
from BASKETBALL_DEV.RAW.stg_common_player_info
where from_year is not null
  and to_year is not null
  and to_year < from_year
      
    ) dbt_internal_test