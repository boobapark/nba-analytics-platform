select
    md5(a.game_id || ':' || a.official_id) as game_official_key,
    a.game_id,
    a.official_id,
    md5('NBA_OFFICIAL:' || a.official_id) as official_key,
    cast(strftime(g.game_date, '%Y%m%d') as integer) as date_key,
    md5(
        'NBA_SEASON:' || cast(g.season_id as varchar) || ':' ||
        coalesce(g.season_type, '')
    ) as season_key
from {{ ref('int_game_official_assignments') }} as a
left join {{ ref('int_game_enriched') }} as g using (game_id)
