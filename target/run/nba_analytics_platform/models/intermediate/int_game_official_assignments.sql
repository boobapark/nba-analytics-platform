
  create or replace   view BASKETBALL_DEV.intermediate.int_game_official_assignments
  
   as (
    select distinct
    game_id,
    official_id,
    first_name,
    last_name,
    jersey_number
from BASKETBALL_DEV.staging.stg_officials
  );

