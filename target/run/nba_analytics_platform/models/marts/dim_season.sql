
  create or replace   view BASKETBALL_DEV.marts.dim_season
  
   as (
    select distinct
    md5(
        'NBA_SEASON:' || cast(season_id as varchar) || ':' ||
        coalesce(season_type, '')
    ) as season_key,
    season_id,
    season_year,
    case
        when season_year is not null
            then cast(season_year as varchar) || '-' ||
                 right(cast(season_year + 1 as varchar), 2)
        else null
    end as season_label,
    season_type
from BASKETBALL_DEV.intermediate.int_game_enriched
where season_id is not null
  );

