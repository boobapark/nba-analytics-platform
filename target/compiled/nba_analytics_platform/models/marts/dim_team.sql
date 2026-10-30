with teams as (
    select *
    from BASKETBALL_DEV.staging.stg_team
    qualify row_number() over (
        partition by team_id
        order by (team_full_name is not null) desc
    ) = 1
),
game_teams as (
    select home_team_id as team_id, home_team_name as team_full_name,
           home_team_abbreviation as team_abbreviation, null::varchar as team_city
    from BASKETBALL_DEV.staging.stg_game
    union
    select away_team_id as team_id, away_team_name as team_full_name,
           away_team_abbreviation as team_abbreviation, null::varchar as team_city
    from BASKETBALL_DEV.staging.stg_game
    union
    select team_id, team_name as team_full_name, team_abbreviation, team_city
    from BASKETBALL_DEV.staging.stg_draft_history
    where team_id is not null
    union
    select team_id, null::varchar as team_full_name, null::varchar as team_abbreviation,
           team_city
    from BASKETBALL_DEV.staging.stg_team_history
    union
    select team_id, team_name as team_full_name, team_abbreviation, team_city
    from BASKETBALL_DEV.staging.stg_inactive_players
    where team_id is not null
),
all_teams as (
    select team_id, team_full_name, team_abbreviation, team_nickname,
           team_city, team_state, year_founded
    from teams
    union all
    select g.team_id, g.team_full_name, g.team_abbreviation, null, g.team_city,
           null, null
    from game_teams as g
    where not exists (
        select 1 from teams as t where t.team_id = g.team_id
    )
),
deduplicated_teams as (
    select *
    from all_teams
    qualify row_number() over (
        partition by team_id
        order by (team_full_name is not null) desc,
                 (team_abbreviation is not null) desc
    ) = 1
),
details as (
    select *
    from BASKETBALL_DEV.staging.stg_team_details
    qualify row_number() over (
        partition by team_id
        order by (arena is not null) desc
    ) = 1
)
select
    md5('NBA_TEAM:' || cast(t.team_id as varchar)) as team_key,
    t.team_id,
    t.team_full_name,
    t.team_abbreviation,
    t.team_nickname,
    t.team_city,
    t.team_state,
    t.year_founded,
    d.arena,
    d.arena_capacity,
    d.owner_name,
    d.general_manager,
    d.head_coach,
    d.g_league_affiliation
from deduplicated_teams as t
left join details as d using (team_id)