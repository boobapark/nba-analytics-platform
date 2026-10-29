
  create or replace   view BASKETBALL_DEV.staging.stg_other_stats
  
   as (
    with source as (

    select *
    from BASKETBALL_DEV.RAW.OTHER_STATS

),

renamed as (

    select

        game_id,

        league_id,

        try_to_number(team_id_home) as home_team_id,
        team_abbreviation_home as home_team_abbreviation,
        team_city_home as home_team_city,

        try_to_number(pts_paint_home) as pts_in_paint_home,
        try_to_number(pts_2nd_chance_home) as second_chance_pts_home,
        try_to_number(pts_fb_home) as fast_break_pts_home,
        try_to_number(largest_lead_home) as largest_lead_home,

        try_to_number(lead_changes) as lead_changes,
        try_to_number(times_tied) as times_tied,

        try_to_number(team_turnovers_home) as team_turnovers_home,
        try_to_number(total_turnovers_home) as total_turnovers_home,
        try_to_number(team_rebounds_home) as team_rebounds_home,
        try_to_number(pts_off_to_home) as pts_off_turnovers_home,

        try_to_number(team_id_away) as away_team_id,
        team_abbreviation_away as away_team_abbreviation,
        team_city_away as away_team_city,

        try_to_number(pts_paint_away) as pts_in_paint_away,
        try_to_number(pts_2nd_chance_away) as second_chance_pts_away,
        try_to_number(pts_fb_away) as fast_break_pts_away,
        try_to_number(largest_lead_away) as largest_lead_away,

        try_to_number(team_turnovers_away) as team_turnovers_away,
        try_to_number(total_turnovers_away) as total_turnovers_away,
        try_to_number(team_rebounds_away) as team_rebounds_away,
        try_to_number(pts_off_to_away) as pts_off_turnovers_away

    from source

)

select *
from renamed
  );

