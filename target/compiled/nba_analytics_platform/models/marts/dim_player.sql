with players as (
    select *
    from BASKETBALL_DEV.staging.stg_player
    qualify row_number() over (
        partition by player_id
        order by (full_name is not null) desc
    ) = 1
),
player_profiles as (
    select *
    from BASKETBALL_DEV.staging.stg_common_player_info
    qualify row_number() over (
        partition by player_id
        order by (birth_date is not null) desc,
                 (display_name is not null) desc
    ) = 1
),
draft_players as (
    select
        player_id,
        max(player_name) as player_name
    from BASKETBALL_DEV.staging.stg_draft_history
    group by player_id
),
combine_players as (
    select
        player_id,
        max(player_name) as player_name
    from BASKETBALL_DEV.staging.stg_draft_combine_stats
    group by player_id
),
inactive_players as (
    select
        player_id,
        max(nullif(trim(concat_ws(' ', first_name, last_name)), '')) as player_name
    from BASKETBALL_DEV.staging.stg_inactive_players
    group by player_id
),
player_ids as (
    select player_id from players
    union
    select player_id from player_profiles
    union
    select player_id from draft_players
    union
    select player_id from combine_players
    union
    select player_id from inactive_players
)
select
    md5('NBA_PLAYER:' || ids.player_id) as player_key,
    ids.player_id,
    coalesce(p.full_name, cp.display_name, dp.player_name, c.player_name, i.player_name) as player_name,
    coalesce(p.first_name, cp.first_name) as first_name,
    coalesce(p.last_name, cp.last_name) as last_name,
    cp.birth_date,
    cp.school,
    cp.country,
    cp.height,
    cp.weight_lbs,
    cp.position,
    cp.seasons_experience,
    cp.draft_year,
    cp.draft_round,
    cp.draft_pick_number,
    cp.is_nba_75_player,
    coalesce(p.is_active, false) as is_active
from player_ids as ids
left join players as p using (player_id)
left join player_profiles as cp using (player_id)
left join draft_players as dp using (player_id)
left join combine_players as c using (player_id)
left join inactive_players as i using (player_id)