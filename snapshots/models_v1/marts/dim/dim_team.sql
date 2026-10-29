select

    team_id,

    team_full_name,
    team_abbreviation,
    team_name,

    city,
    state,

    year_founded,

    arena,
    arena_capacity,

    owner,
    general_manager,
    head_coach,

    g_league_affiliate,
    has_g_league_affiliate

from {{ ref('int_team') }}