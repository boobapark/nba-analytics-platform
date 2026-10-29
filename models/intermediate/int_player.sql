with player as (

    select *
    from {{ ref('stg_player') }}

),

info as (

    select *
    from {{ ref('stg_common_player_info') }}

)

select

    p.player_id,

    coalesce(
        i.full_name,
        p.full_name
    ) as full_name,

    p.first_name,
    p.last_name,

    i.birth_date,

    i.school,
    i.country,

    i.height,
    i.weight_lbs,

    i.position,

    i.team_id,

    i.first_season_year,
    i.last_season_year,

    i.draft_year,
    i.draft_round,
    i.draft_pick_number,

    p.is_active,

    case
        when i.greatest_75_flag = 'Y'
        then true
        else false
    end as is_nba_75_player,

    datediff(
        year,
        i.birth_date,
        current_date
    ) as player_age,

    current_date is not null
        as player_exists

from player p
left join info i
    on p.player_id = i.player_id