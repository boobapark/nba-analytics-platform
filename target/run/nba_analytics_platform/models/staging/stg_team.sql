
  create or replace   view BASKETBALL_DEV.staging.stg_team
  
   as (
    with source as (
    select * from BASKETBALL_DEV.RAW.team
),
typed as (
    select
        try_cast(nullif(trim(cast(id as varchar)), '') as bigint) as team_id,
        nullif(trim(cast(full_name as varchar)), '') as team_full_name,
        nullif(trim(cast(abbreviation as varchar)), '') as team_abbreviation,
        nullif(trim(cast(nickname as varchar)), '') as team_nickname,
        nullif(trim(cast(city as varchar)), '') as team_city,
        nullif(trim(cast(state as varchar)), '') as team_state,
        try_cast(nullif(trim(cast(year_founded as varchar)), '') as bigint) as year_founded
    from source
)
select distinct * from typed
where team_id is not null
  );

