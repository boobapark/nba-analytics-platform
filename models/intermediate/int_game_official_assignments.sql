select distinct
    game_id,
    official_id,
    first_name,
    last_name,
    jersey_number
from {{ ref('stg_officials') }}
