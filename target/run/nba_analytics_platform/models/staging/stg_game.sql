
  create or replace   view BASKETBALL_DEV.staging.stg_game
  
   as (
    with source as (
    select * from BASKETBALL_DEV.RAW.game
),
typed as (
    select
        nullif(trim(cast(game_id as varchar)), '') as game_id,
        try_cast(nullif(trim(cast(season_id as varchar)), '') as bigint) as season_id,
        try_cast(nullif(trim(cast(game_date as varchar)), '') as date) as game_date,
        nullif(trim(cast(season_type as varchar)), '') as season_type_raw,
        try_cast(nullif(trim(cast(team_id_home as varchar)), '') as bigint) as home_team_id,
        nullif(trim(cast(team_abbreviation_home as varchar)), '') as home_team_abbreviation,
        nullif(trim(cast(team_name_home as varchar)), '') as home_team_name,
        nullif(trim(cast(matchup_home as varchar)), '') as home_matchup,
        nullif(trim(cast(wl_home as varchar)), '') as home_win_loss,
        try_cast(nullif(trim(cast(team_id_away as varchar)), '') as bigint) as away_team_id,
        nullif(trim(cast(team_abbreviation_away as varchar)), '') as away_team_abbreviation,
        nullif(trim(cast(team_name_away as varchar)), '') as away_team_name,
        nullif(trim(cast(matchup_away as varchar)), '') as away_matchup,
        nullif(trim(cast(wl_away as varchar)), '') as away_win_loss,
        try_cast(nullif(trim(cast(min as varchar)), '') as bigint) as game_minutes,
        try_cast(nullif(trim(cast(fgm_home as varchar)), '') as double) as home_field_goals_made,
        try_cast(nullif(trim(cast(fga_home as varchar)), '') as double) as home_field_goals_attempted,
        try_cast(nullif(trim(cast(fg_pct_home as varchar)), '') as double) as home_field_goal_pct,
        try_cast(nullif(trim(cast(fg3m_home as varchar)), '') as double) as home_three_pointers_made,
        try_cast(nullif(trim(cast(fg3a_home as varchar)), '') as double) as home_three_pointers_attempted,
        try_cast(nullif(trim(cast(fg3_pct_home as varchar)), '') as double) as home_three_point_pct,
        try_cast(nullif(trim(cast(ftm_home as varchar)), '') as double) as home_free_throws_made,
        try_cast(nullif(trim(cast(fta_home as varchar)), '') as double) as home_free_throws_attempted,
        try_cast(nullif(trim(cast(ft_pct_home as varchar)), '') as double) as home_free_throw_pct,
        try_cast(nullif(trim(cast(oreb_home as varchar)), '') as double) as home_offensive_rebounds,
        try_cast(nullif(trim(cast(dreb_home as varchar)), '') as double) as home_defensive_rebounds,
        try_cast(nullif(trim(cast(reb_home as varchar)), '') as double) as home_rebounds,
        try_cast(nullif(trim(cast(ast_home as varchar)), '') as double) as home_assists,
        try_cast(nullif(trim(cast(stl_home as varchar)), '') as double) as home_steals,
        try_cast(nullif(trim(cast(blk_home as varchar)), '') as double) as home_blocks,
        try_cast(nullif(trim(cast(tov_home as varchar)), '') as double) as home_turnovers,
        try_cast(nullif(trim(cast(pf_home as varchar)), '') as double) as home_personal_fouls,
        try_cast(nullif(trim(cast(pts_home as varchar)), '') as double) as home_points,
        try_cast(nullif(trim(cast(plus_minus_home as varchar)), '') as bigint) as home_plus_minus,
        case
    when lower(nullif(trim(cast(video_available_home as varchar)), '')) in ('true', '1', 'yes', 'y') then true
    when lower(nullif(trim(cast(video_available_home as varchar)), '')) in ('false', '0', 'no', 'n') then false
    else null
end as home_video_available,
        try_cast(nullif(trim(cast(fgm_away as varchar)), '') as double) as away_field_goals_made,
        try_cast(nullif(trim(cast(fga_away as varchar)), '') as double) as away_field_goals_attempted,
        try_cast(nullif(trim(cast(fg_pct_away as varchar)), '') as double) as away_field_goal_pct,
        try_cast(nullif(trim(cast(fg3m_away as varchar)), '') as double) as away_three_pointers_made,
        try_cast(nullif(trim(cast(fg3a_away as varchar)), '') as double) as away_three_pointers_attempted,
        try_cast(nullif(trim(cast(fg3_pct_away as varchar)), '') as double) as away_three_point_pct,
        try_cast(nullif(trim(cast(ftm_away as varchar)), '') as double) as away_free_throws_made,
        try_cast(nullif(trim(cast(fta_away as varchar)), '') as double) as away_free_throws_attempted,
        try_cast(nullif(trim(cast(ft_pct_away as varchar)), '') as double) as away_free_throw_pct,
        try_cast(nullif(trim(cast(oreb_away as varchar)), '') as double) as away_offensive_rebounds,
        try_cast(nullif(trim(cast(dreb_away as varchar)), '') as double) as away_defensive_rebounds,
        try_cast(nullif(trim(cast(reb_away as varchar)), '') as double) as away_rebounds,
        try_cast(nullif(trim(cast(ast_away as varchar)), '') as double) as away_assists,
        try_cast(nullif(trim(cast(stl_away as varchar)), '') as double) as away_steals,
        try_cast(nullif(trim(cast(blk_away as varchar)), '') as double) as away_blocks,
        try_cast(nullif(trim(cast(tov_away as varchar)), '') as double) as away_turnovers,
        try_cast(nullif(trim(cast(pf_away as varchar)), '') as double) as away_personal_fouls,
        try_cast(nullif(trim(cast(pts_away as varchar)), '') as double) as away_points,
        try_cast(nullif(trim(cast(plus_minus_away as varchar)), '') as bigint) as away_plus_minus,
        case
    when lower(nullif(trim(cast(video_available_away as varchar)), '')) in ('true', '1', 'yes', 'y') then true
    when lower(nullif(trim(cast(video_available_away as varchar)), '')) in ('false', '0', 'no', 'n') then false
    else null
end as away_video_available
    from source
),
normalized as (
    select
        * exclude (season_type_raw),
        case
            when lower(replace(trim(season_type_raw), '-', ' ')) = 'all star' then 'All-Star'
            else season_type_raw
        end as season_type
    from typed
)
select distinct * from normalized
where game_id is not null
  );

