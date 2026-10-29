with source as (
    select * from {{ source('raw', 'game') }}
),
typed as (
    select
        {{ clean_value('game_id') }} as game_id,
        {{ safe_integer('season_id') }} as season_id,
        {{ safe_date('game_date') }} as game_date,
        {{ clean_value('season_type') }} as season_type_raw,
        {{ safe_integer('team_id_home') }} as home_team_id,
        {{ clean_value('team_abbreviation_home') }} as home_team_abbreviation,
        {{ clean_value('team_name_home') }} as home_team_name,
        {{ clean_value('matchup_home') }} as home_matchup,
        {{ clean_value('wl_home') }} as home_win_loss,
        {{ safe_integer('team_id_away') }} as away_team_id,
        {{ clean_value('team_abbreviation_away') }} as away_team_abbreviation,
        {{ clean_value('team_name_away') }} as away_team_name,
        {{ clean_value('matchup_away') }} as away_matchup,
        {{ clean_value('wl_away') }} as away_win_loss,
        {{ safe_integer('min') }} as game_minutes,
        {{ safe_decimal('fgm_home') }} as home_field_goals_made,
        {{ safe_decimal('fga_home') }} as home_field_goals_attempted,
        {{ safe_decimal('fg_pct_home') }} as home_field_goal_pct,
        {{ safe_decimal('fg3m_home') }} as home_three_pointers_made,
        {{ safe_decimal('fg3a_home') }} as home_three_pointers_attempted,
        {{ safe_decimal('fg3_pct_home') }} as home_three_point_pct,
        {{ safe_decimal('ftm_home') }} as home_free_throws_made,
        {{ safe_decimal('fta_home') }} as home_free_throws_attempted,
        {{ safe_decimal('ft_pct_home') }} as home_free_throw_pct,
        {{ safe_decimal('oreb_home') }} as home_offensive_rebounds,
        {{ safe_decimal('dreb_home') }} as home_defensive_rebounds,
        {{ safe_decimal('reb_home') }} as home_rebounds,
        {{ safe_decimal('ast_home') }} as home_assists,
        {{ safe_decimal('stl_home') }} as home_steals,
        {{ safe_decimal('blk_home') }} as home_blocks,
        {{ safe_decimal('tov_home') }} as home_turnovers,
        {{ safe_decimal('pf_home') }} as home_personal_fouls,
        {{ safe_decimal('pts_home') }} as home_points,
        {{ safe_integer('plus_minus_home') }} as home_plus_minus,
        {{ safe_boolean('video_available_home') }} as home_video_available,
        {{ safe_decimal('fgm_away') }} as away_field_goals_made,
        {{ safe_decimal('fga_away') }} as away_field_goals_attempted,
        {{ safe_decimal('fg_pct_away') }} as away_field_goal_pct,
        {{ safe_decimal('fg3m_away') }} as away_three_pointers_made,
        {{ safe_decimal('fg3a_away') }} as away_three_pointers_attempted,
        {{ safe_decimal('fg3_pct_away') }} as away_three_point_pct,
        {{ safe_decimal('ftm_away') }} as away_free_throws_made,
        {{ safe_decimal('fta_away') }} as away_free_throws_attempted,
        {{ safe_decimal('ft_pct_away') }} as away_free_throw_pct,
        {{ safe_decimal('oreb_away') }} as away_offensive_rebounds,
        {{ safe_decimal('dreb_away') }} as away_defensive_rebounds,
        {{ safe_decimal('reb_away') }} as away_rebounds,
        {{ safe_decimal('ast_away') }} as away_assists,
        {{ safe_decimal('stl_away') }} as away_steals,
        {{ safe_decimal('blk_away') }} as away_blocks,
        {{ safe_decimal('tov_away') }} as away_turnovers,
        {{ safe_decimal('pf_away') }} as away_personal_fouls,
        {{ safe_decimal('pts_away') }} as away_points,
        {{ safe_integer('plus_minus_away') }} as away_plus_minus,
        {{ safe_boolean('video_available_away') }} as away_video_available
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
