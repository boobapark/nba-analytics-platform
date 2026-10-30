
  create or replace   view BASKETBALL_DEV.marts.fact_inactive_player
  
   as (
    select
    md5(game_id || ':' || player_id) as inactive_player_key,
    game_id,
    player_id,

    md5('NBA_PLAYER:' || player_id) as player_key,

    team_id,

    case
        when team_id is not null
            then md5('NBA_TEAM:' || cast(team_id as varchar))
        else null
    end as team_key,

    first_name,
    last_name,
    jersey_number,
    team_abbreviation,

    to_number(
        to_char(g.game_date, 'YYYYMMDD')
    ) as date_key,

    md5(
        'NBA_SEASON:' || cast(g.season_id as varchar) || ':' ||
        coalesce(g.season_type, '')
    ) as season_key

from BASKETBALL_DEV.intermediate.int_inactive_player_appearances as i
left join BASKETBALL_DEV.intermediate.int_game_enriched as g
    using (game_id)
  );

