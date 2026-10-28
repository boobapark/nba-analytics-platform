select
    player_id,
    from_year,
    to_year
from {{ ref('stg_common_player_info') }}
where from_year is not null
  and to_year is not null
  and to_year < from_year
