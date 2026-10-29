
  create or replace   view BASKETBALL_DEV.intermediate.int_draft_combine
  
   as (
    with source as (

    select *
    from BASKETBALL_DEV.staging.stg_draft_combine_stats

)

select

    *,

    case
        when height_wo_shoes >= 82
            then 'BIG'
        when height_wo_shoes >= 77
            then 'WING'
        else 'GUARD'
    end as height_category,

    wingspan >= 84
        as is_elite_wingspan,

    max_vertical_leap >= 40
        as is_elite_vertical_jump

from source
  );

