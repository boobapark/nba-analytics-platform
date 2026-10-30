with game_info as (
    select *
    from BASKETBALL_DEV.staging.stg_game_info
    qualify row_number() over (
        partition by game_id
        order by (attendance is not null) desc, game_duration desc nulls last
    ) = 1
),
line_score as (
    select *
    from BASKETBALL_DEV.staging.stg_line_score
    qualify row_number() over (
        partition by game_id
        order by (home_points is not null and away_points is not null) desc,
                 game_sequence nulls last
    ) = 1
),
other_stats as (
    select *
    from BASKETBALL_DEV.staging.stg_other_stats
    qualify row_number() over (
        partition by game_id
        order by (lead_changes is not null) desc,
                 (home_points_in_paint is not null) desc
    ) = 1
),
summary as (
    select *
    from BASKETBALL_DEV.staging.stg_game_summary
    qualify row_number() over (
        partition by game_id
        order by (game_status is not null) desc,
                 game_sequence nulls last
    ) = 1
)
select
    g.game_id,
    g.game_date,
    g.season_id,
    try_cast(substr(cast(g.season_id as varchar), 2, 4) as integer) as season_year,
    g.season_type,
    g.home_team_id,
    g.away_team_id,
    g.home_team_abbreviation,
    g.away_team_abbreviation,
    g.home_team_name,
    g.away_team_name,
    g.home_win_loss,
    g.away_win_loss,
    g.game_minutes,
    coalesce(g.home_points, ls.home_points) as home_points,
    coalesce(g.away_points, ls.away_points) as away_points,
    g.home_field_goals_made,
    g.home_field_goals_attempted,
    g.home_field_goal_pct,
    g.home_three_pointers_made,
    g.home_three_pointers_attempted,
    g.home_three_point_pct,
    g.home_free_throws_made,
    g.home_free_throws_attempted,
    g.home_free_throw_pct,
    g.home_offensive_rebounds,
    g.home_defensive_rebounds,
    g.home_rebounds,
    g.home_assists,
    g.home_steals,
    g.home_blocks,
    g.home_turnovers,
    g.home_personal_fouls,
    g.home_plus_minus,
    g.away_field_goals_made,
    g.away_field_goals_attempted,
    g.away_field_goal_pct,
    g.away_three_pointers_made,
    g.away_three_pointers_attempted,
    g.away_three_point_pct,
    g.away_free_throws_made,
    g.away_free_throws_attempted,
    g.away_free_throw_pct,
    g.away_offensive_rebounds,
    g.away_defensive_rebounds,
    g.away_rebounds,
    g.away_assists,
    g.away_steals,
    g.away_blocks,
    g.away_turnovers,
    g.away_personal_fouls,
    g.away_plus_minus,
    gi.attendance,
    gi.game_duration,
    os.home_points_in_paint,
    os.home_second_chance_points,
    os.home_fast_break_points,
    os.home_largest_lead,
    os.home_team_turnovers,
    os.home_total_turnovers,
    os.home_team_rebounds,
    os.home_points_off_turnovers,
    os.away_points_in_paint,
    os.away_second_chance_points,
    os.away_fast_break_points,
    os.away_largest_lead,
    os.away_team_turnovers,
    os.away_total_turnovers,
    os.away_team_rebounds,
    os.away_points_off_turnovers,
    os.lead_changes,
    os.times_tied,
    ls.home_q1_points,
    ls.home_q2_points,
    ls.home_q3_points,
    ls.home_q4_points,
    ls.away_q1_points,
    ls.away_q2_points,
    ls.away_q3_points,
    ls.away_q4_points,
    s.game_status,
    s.tv_broadcaster
from BASKETBALL_DEV.staging.stg_game as g
left join game_info as gi using (game_id)
left join line_score as ls using (game_id)
left join other_stats as os using (game_id)
left join summary as s using (game_id)
where g.home_team_id is not null
  and g.away_team_id is not null