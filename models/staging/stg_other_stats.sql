with source as (
    select * from {{ source('raw', 'other_stats') }}
)
select distinct
    {{ clean_value('game_id') }} as game_id,
    {{ safe_integer('team_id_home') }} as home_team_id,
    {{ safe_integer('team_id_away') }} as away_team_id,
    {{ safe_integer('pts_paint_home') }} as home_points_in_paint,
    {{ safe_integer('pts_2nd_chance_home') }} as home_second_chance_points,
    {{ safe_integer('pts_fb_home') }} as home_fast_break_points,
    {{ safe_integer('largest_lead_home') }} as home_largest_lead,
    {{ safe_integer('lead_changes') }} as lead_changes,
    {{ safe_integer('times_tied') }} as times_tied,
    {{ safe_integer('team_turnovers_home') }} as home_team_turnovers,
    {{ safe_integer('total_turnovers_home') }} as home_total_turnovers,
    {{ safe_integer('team_rebounds_home') }} as home_team_rebounds,
    {{ safe_integer('pts_off_to_home') }} as home_points_off_turnovers,
    {{ safe_integer('pts_paint_away') }} as away_points_in_paint,
    {{ safe_integer('pts_2nd_chance_away') }} as away_second_chance_points,
    {{ safe_integer('pts_fb_away') }} as away_fast_break_points,
    {{ safe_integer('largest_lead_away') }} as away_largest_lead,
    {{ safe_integer('team_turnovers_away') }} as away_team_turnovers,
    {{ safe_integer('total_turnovers_away') }} as away_total_turnovers,
    {{ safe_integer('team_rebounds_away') }} as away_team_rebounds,
    {{ safe_integer('pts_off_to_away') }} as away_points_off_turnovers
from source
where {{ clean_value('game_id') }} is not null
