
  create or replace   view BASKETBALL_DEV.staging.stg_common_player_info
  
   as (
    with source as (
    select * from BASKETBALL_DEV.RAW.common_player_info
),
typed as (
    select
        nullif(trim(cast(person_id as varchar)), '') as player_id,
        nullif(trim(cast(first_name as varchar)), '') as first_name,
        nullif(trim(cast(last_name as varchar)), '') as last_name,
        nullif(trim(cast(display_first_last as varchar)), '') as display_name,
        nullif(trim(cast(player_slug as varchar)), '') as player_slug,
        try_cast(nullif(trim(cast(birthdate as varchar)), '') as date) as birth_date,
        nullif(trim(cast(school as varchar)), '') as school,
        nullif(trim(cast(country as varchar)), '') as country,
        nullif(trim(cast(height as varchar)), '') as height,
        try_cast(nullif(trim(cast(weight as varchar)), '') as double) as weight_lbs,
        try_cast(nullif(trim(cast(season_exp as varchar)), '') as bigint) as seasons_experience,
        nullif(trim(cast(jersey as varchar)), '') as jersey_number,
        nullif(trim(cast(position as varchar)), '') as position,
        try_cast(nullif(trim(cast(team_id as varchar)), '') as bigint) as current_team_id,
        try_cast(nullif(trim(cast(from_year as varchar)), '') as bigint) as career_start_year,
        try_cast(nullif(trim(cast(to_year as varchar)), '') as bigint) as career_end_year,
        try_cast(nullif(trim(cast(draft_year as varchar)), '') as bigint) as draft_year,
        try_cast(nullif(trim(cast(draft_round as varchar)), '') as bigint) as draft_round,
        try_cast(nullif(trim(cast(draft_number as varchar)), '') as bigint) as draft_pick_number,
        case
    when lower(nullif(trim(cast(greatest_75_flag as varchar)), '')) in ('true', '1', 'yes', 'y') then true
    when lower(nullif(trim(cast(greatest_75_flag as varchar)), '')) in ('false', '0', 'no', 'n') then false
    else null
end as is_nba_75_player
    from source
)
select distinct * from typed
where player_id is not null
  );

