select

    game_id,

    to_number(to_char(game_date,'YYYYMMDD'))
        as date_id,

    season_id,
    season_type,

    home_team_id,
    away_team_id,

    winner_team_id,
    loser_team_id,

    is_home_win,
    is_away_win,

    is_close_game,

    attendance,
    game_duration,

    point_difference,
    total_points,

    pts_home,
    pts_away,

    reb_home,
    reb_away,

    ast_home,
    ast_away,

    stl_home,
    stl_away,

    blk_home,
    blk_away,

    tov_home,
    tov_away,

    lead_changes,
    times_tied

from BASKETBALL_DEV.intermediate.int_game