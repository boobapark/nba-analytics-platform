
  create or replace   view BASKETBALL_DEV.intermediate.int_game
  
   as (
    with game as (

    select *
    from BASKETBALL_DEV.staging.stg_game

),

summary as (

    select *
    from BASKETBALL_DEV.staging.stg_game_summary

),

info as (

    select *
    from BASKETBALL_DEV.staging.stg_game_info

),

other_stats as (

    select *
    from BASKETBALL_DEV.staging.stg_other_stats

)

select

    g.game_id,

    g.game_date,

    g.season_id,
    g.season_type,

    g.home_team_id,
    g.away_team_id,

    g.pts_home,
    g.pts_away,

    g.reb_home,
    g.reb_away,

    g.ast_home,
    g.ast_away,

    g.stl_home,
    g.stl_away,

    g.blk_home,
    g.blk_away,

    g.tov_home,
    g.tov_away,

    abs(g.pts_home - g.pts_away)
        as point_difference,

    g.pts_home + g.pts_away
        as total_points,

    case
        when g.pts_home > g.pts_away
        then g.home_team_id
        else g.away_team_id
    end as winner_team_id,

    case
        when g.pts_home > g.pts_away
        then g.away_team_id
        else g.home_team_id
    end as loser_team_id,

    g.pts_home > g.pts_away
        as is_home_win,

    g.pts_away > g.pts_home
        as is_away_win,

    abs(g.pts_home - g.pts_away) <= 5
        as is_close_game,

    info.attendance,
    info.game_duration,

    other_stats.lead_changes,
    other_stats.times_tied,

    other_stats.pts_in_paint_home,
    other_stats.pts_in_paint_away,

    other_stats.fast_break_pts_home,
    other_stats.fast_break_pts_away,

    other_stats.second_chance_pts_home,
    other_stats.second_chance_pts_away

from game g

left join info
    on g.game_id = info.game_id

left join summary
    on g.game_id = summary.game_id

left join other_stats
    on g.game_id = other_stats.game_id
  );

