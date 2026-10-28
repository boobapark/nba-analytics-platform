
  create or replace   view BASKETBALL_DEV.RAW_staging.stg_game
  
   as (
    with source as (

    select *
    from BASKETBALL_DEV.RAW.GAME

),

renamed as (

    select

        game_id,
        try_to_date(game_date) as game_date,

        try_to_number(season_id) as season_id,
        season_type,

        try_to_number(team_id_home) as home_team_id,
        team_abbreviation_home as home_team_abbreviation,
        team_name_home as home_team_name,
        matchup_home as home_matchup,
        wl_home as home_result,

        try_to_number(team_id_away) as away_team_id,
        team_abbreviation_away as away_team_abbreviation,
        team_name_away as away_team_name,
        matchup_away as away_matchup,
        wl_away as away_result,

        try_to_number(min) as minutes,

        fgm_home,
        fga_home,
        fg_pct_home,
        fg3m_home,
        fg3a_home,
        fg3_pct_home,
        ftm_home,
        fta_home,
        ft_pct_home,
        oreb_home,
        dreb_home,
        reb_home,
        ast_home,
        stl_home,
        blk_home,
        tov_home,
        pf_home,
        pts_home,
        plus_minus_home,
        video_available_home,

        fgm_away,
        fga_away,
        fg_pct_away,
        fg3m_away,
        fg3a_away,
        fg3_pct_away,
        ftm_away,
        fta_away,
        ft_pct_away,
        oreb_away,
        dreb_away,
        reb_away,
        ast_away,
        stl_away,
        blk_away,
        tov_away,
        pf_away,
        pts_away,
        plus_minus_away,
        video_available_away

    from source

)

select *
from renamed
  );

