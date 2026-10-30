select
    md5(cast(g.game_id as varchar) || ':' || cast(g.team_id as varchar)) as team_game_key,
    g.game_id,

    to_number(to_char(g.game_date, 'YYYYMMDD')) as date_key,

    md5(
        'NBA_SEASON:' || cast(g.season_id as varchar) || ':' ||
        coalesce(g.season_type, '')
    ) as season_key,

    md5('NBA_TEAM:' || cast(g.team_id as varchar)) as team_key,
    md5('NBA_TEAM:' || cast(g.opponent_team_id as varchar)) as opponent_team_key,

    g.team_id,
    g.opponent_team_id,
    g.team_role,
    g.season_id,
    g.season_year,
    g.season_type,
    g.is_win,

    g.points,
    g.opponent_points,
    g.points - g.opponent_points as point_differential,

    g.field_goals_made,
    g.field_goals_attempted,
    g.field_goal_pct,

    g.three_pointers_made,
    g.three_pointers_attempted,
    g.three_point_pct,

    g.free_throws_made,
    g.free_throws_attempted,
    g.free_throw_pct,

    g.offensive_rebounds,
    g.defensive_rebounds,
    g.rebounds,
    g.assists,
    g.steals,
    g.blocks,
    g.turnovers,
    g.personal_fouls,

    g.points_in_paint,
    g.second_chance_points,
    g.fast_break_points,
    g.points_off_turnovers,

    g.attendance,
    g.game_minutes,
    g.lead_changes,
    g.times_tied

from BASKETBALL_DEV.intermediate.int_team_game_stats as g
where g.game_date is not null