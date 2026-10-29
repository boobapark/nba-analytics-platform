select

    game_id,

    event_number,

    player1_id,
    player2_id,
    player3_id,

    player1_team_id,
    player2_team_id,
    player3_team_id,

    period,

    event_category,

    is_made_shot,
    is_missed_shot,

    is_free_throw,

    is_rebound,

    is_turnover,

    is_foul,

    is_timeout,

    is_substitution,

    score,
    score_margin

from {{ ref('int_play_by_play') }}