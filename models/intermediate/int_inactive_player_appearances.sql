select distinct
    game_id,
    player_id,
    team_id,
    first_name,
    last_name,
    jersey_number,
    team_abbreviation
from {{ ref('stg_inactive_players') }}
