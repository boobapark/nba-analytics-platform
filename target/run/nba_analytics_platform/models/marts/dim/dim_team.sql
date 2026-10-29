
  create or replace   view BASKETBALL_DEV.marts.dim_team
  
   as (
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

from BASKETBALL_DEV.intermediate.int_team
  );

