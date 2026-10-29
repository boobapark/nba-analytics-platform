with officials as (
    select
        official_id,
        first_name,
        last_name,
        jersey_number,
        row_number() over (
            partition by official_id
            order by (first_name is not null) desc,
                     (last_name is not null) desc
        ) as row_num
    from {{ ref('stg_officials') }}
)
select
    md5('NBA_OFFICIAL:' || official_id) as official_key,
    official_id,
    first_name,
    last_name,
    concat_ws(' ', first_name, last_name) as official_name,
    jersey_number
from officials
where row_num = 1
