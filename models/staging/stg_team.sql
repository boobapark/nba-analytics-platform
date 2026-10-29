with source as (
    select * from {{ source('raw', 'team') }}
),
typed as (
    select
        {{ safe_integer('id') }} as team_id,
        {{ clean_value('full_name') }} as team_full_name,
        {{ clean_value('abbreviation') }} as team_abbreviation,
        {{ clean_value('nickname') }} as team_nickname,
        {{ clean_value('city') }} as team_city,
        {{ clean_value('state') }} as team_state,
        {{ safe_integer('year_founded') }} as year_founded
    from source
)
select distinct * from typed
where team_id is not null
