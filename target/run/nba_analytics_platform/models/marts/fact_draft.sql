
  create or replace   view BASKETBALL_DEV.marts.fact_draft
  
   as (
    select
    md5(
        'NBA_DRAFT:' || coalesce(player_id, '') || ':' ||
        coalesce(cast(draft_year as varchar), '') || ':' ||
        coalesce(cast(draft_round as varchar), '') || ':' ||
        coalesce(cast(round_pick as varchar), '')
    ) as draft_selection_key,
    player_id,
    md5('NBA_PLAYER:' || player_id) as player_key,
    team_id,
    case when team_id is not null
        then md5('NBA_TEAM:' || cast(team_id as varchar))
        else null
    end as team_key,
    draft_year,
    draft_round,
    round_pick,
    overall_pick,
    draft_type,
    canonical_player_name as player_name,
    canonical_team_name as team_name,
    organization,
    organization_type,
    overall_pick = 1 as is_first_overall_pick,
    draft_round = 1 as is_first_round,
    case when overall_pick between 1 and 14 then true else false end as is_lottery_pick,
    case when overall_pick between 1 and 10 then true else false end as is_top_10_pick
from BASKETBALL_DEV.intermediate.int_draft_selections
  );

