
  create or replace   view BASKETBALL_DEV.intermediate.int_inactive_player_appearances
  
   as (
    select distinct
    game_id,
    player_id,
    team_id,
    first_name,
    last_name,
    jersey_number,
    team_abbreviation
from BASKETBALL_DEV.staging.stg_inactive_players
  );

