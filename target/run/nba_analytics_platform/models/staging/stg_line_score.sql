
  create or replace   view BASKETBALL_DEV.RAW_staging.stg_line_score
  
   as (
    with source as (

    select *
    from BASKETBALL_DEV.RAW.LINE_SCORE

),

renamed as (

    select

        game_id,

        try_to_date(game_date_est) as game_date,

        try_to_number(game_sequence) as game_sequence,

        try_to_number(team_id_home) as home_team_id,
        team_abbreviation_home as home_team_abbreviation,
        team_city_name_home as home_team_city,
        team_nickname_home as home_team_name,
        team_wins_losses_home as home_record,

        try_to_number(team_id_away) as away_team_id,
        team_abbreviation_away as away_team_abbreviation,
        team_city_name_away as away_team_city,
        team_nickname_away as away_team_name,
        team_wins_losses_away as away_record,

        pts_qtr1_home,
        pts_qtr2_home,
        pts_qtr3_home,
        pts_qtr4_home,

        pts_ot1_home,
        pts_ot2_home,
        pts_ot3_home,
        pts_ot4_home,
        pts_ot5_home,
        pts_ot6_home,
        pts_ot7_home,
        pts_ot8_home,
        pts_ot9_home,
        pts_ot10_home,

        pts_home,

        pts_qtr1_away,
        pts_qtr2_away,
        pts_qtr3_away,
        pts_qtr4_away,

        pts_ot1_away,
        pts_ot2_away,
        pts_ot3_away,
        pts_ot4_away,
        pts_ot5_away,
        pts_ot6_away,
        pts_ot7_away,
        pts_ot8_away,
        pts_ot9_away,
        pts_ot10_away,

        pts_away

    from source

)

select *
from renamed
  );

