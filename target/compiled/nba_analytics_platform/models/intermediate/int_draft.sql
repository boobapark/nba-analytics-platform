with source as (

    select *
    from BASKETBALL_DEV.staging.stg_draft_history

)

select

    *,

    draft_round = 1
        as is_first_round,

    draft_round = 2
        as is_second_round,

    draft_pick_number <= 14
        as is_lottery_pick,

    draft_pick_number <= 10
        as is_top_10_pick,

    draft_pick_number = 1
        as is_number_one_pick

from source