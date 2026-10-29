{{ config(materialized='table', tags=['large']) }}

select
    md5(e.game_id || ':' || cast(e.event_number as varchar)) as play_key,
    e.game_id,
    e.event_number,
    cast(strftime(g.game_date, '%Y%m%d') as integer) as date_key,
    md5(
        'NBA_SEASON:' || cast(g.season_id as varchar) || ':' ||
        coalesce(g.season_type, '')
    ) as season_key,
    e.event_type_id,
    e.event_action_type_id,
    e.event_category,
    e.period_number,
    e.game_clock,
    e.period_clock,
    e.home_description,
    e.neutral_description,
    e.away_description,
    e.score_text,
    e.score_margin,
    e.player1_id,
    md5('NBA_PLAYER:' || e.player1_id) as player1_key,
    e.player1_name,
    e.player1_team_id,
    case when e.player1_team_id is not null
        then md5('NBA_TEAM:' || cast(e.player1_team_id as varchar))
        else null
    end as player1_team_key,
    e.player2_id,
    md5('NBA_PLAYER:' || e.player2_id) as player2_key,
    e.player2_name,
    e.player2_team_id,
    e.player3_id,
    md5('NBA_PLAYER:' || e.player3_id) as player3_key,
    e.player3_name,
    e.player3_team_id,
    e.video_available
from {{ ref('int_play_by_play') }} as e
left join {{ ref('int_game_enriched') }} as g using (game_id)
