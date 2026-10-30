with selections as (
    select *
    from BASKETBALL_DEV.staging.stg_draft_history
    qualify row_number() over (
        partition by player_id, draft_year, draft_round, round_pick
        order by (overall_pick is not null) desc
    ) = 1
)
select
    s.*,
    coalesce(p.full_name, s.player_name) as canonical_player_name,
    coalesce(t.team_full_name, s.team_name) as canonical_team_name
from selections as s
left join BASKETBALL_DEV.staging.stg_player as p
    on s.player_id = p.player_id
left join BASKETBALL_DEV.staging.stg_team as t
    on s.team_id = t.team_id