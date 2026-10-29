with source as (
    select * from {{ source('raw', 'player') }}
),
typed as (
    select
        {{ clean_value('id') }} as player_id,
        {{ clean_value('full_name') }} as full_name,
        {{ clean_value('first_name') }} as first_name,
        {{ clean_value('last_name') }} as last_name,
        {{ safe_boolean('is_active') }} as is_active
    from source
)
select distinct * from typed
where player_id is not null
