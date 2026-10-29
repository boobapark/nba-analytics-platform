with source as (
    select * from {{ source('raw', 'common_player_info') }}
),
typed as (
    select
        {{ clean_value('person_id') }} as player_id,
        {{ clean_value('first_name') }} as first_name,
        {{ clean_value('last_name') }} as last_name,
        {{ clean_value('display_first_last') }} as display_name,
        {{ clean_value('player_slug') }} as player_slug,
        {{ safe_date('birthdate') }} as birth_date,
        {{ clean_value('school') }} as school,
        {{ clean_value('country') }} as country,
        {{ clean_value('height') }} as height,
        {{ safe_decimal('weight') }} as weight_lbs,
        {{ safe_integer('season_exp') }} as seasons_experience,
        {{ clean_value('jersey') }} as jersey_number,
        {{ clean_value('position') }} as position,
        {{ safe_integer('team_id') }} as current_team_id,
        {{ safe_integer('from_year') }} as career_start_year,
        {{ safe_integer('to_year') }} as career_end_year,
        {{ safe_integer('draft_year') }} as draft_year,
        {{ safe_integer('draft_round') }} as draft_round,
        {{ safe_integer('draft_number') }} as draft_pick_number,
        {{ safe_boolean('greatest_75_flag') }} as is_nba_75_player
    from source
)
select distinct * from typed
where player_id is not null
