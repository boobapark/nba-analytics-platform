with source as (
    select * from {{ source('raw', 'team_info_common') }}
)
select distinct
    {{ safe_integer('team_id') }} as team_id,
    {{ clean_value('season_year') }} as season_year,
    {{ clean_value('team_city') }} as team_city,
    {{ clean_value('team_name') }} as team_name,
    {{ clean_value('team_abbreviation') }} as team_abbreviation,
    {{ clean_value('team_conference') }} as team_conference,
    {{ clean_value('team_division') }} as team_division,
    {{ safe_integer('w') }} as wins,
    {{ safe_integer('l') }} as losses,
    {{ safe_decimal('pct') }} as win_pct,
    {{ safe_integer('conf_rank') }} as conference_rank,
    {{ safe_integer('div_rank') }} as division_rank,
    {{ safe_integer('pts_pg') }} as points_per_game,
    {{ safe_integer('reb_pg') }} as rebounds_per_game,
    {{ safe_integer('ast_pg') }} as assists_per_game,
    {{ safe_integer('opp_pts_pg') }} as opponent_points_per_game
from source
where {{ clean_value('team_id') }} is not null
