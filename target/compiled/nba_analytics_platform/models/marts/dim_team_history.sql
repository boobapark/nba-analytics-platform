select distinct
    md5(
        'NBA_TEAM_HISTORY:' || cast(team_id as varchar) || ':' ||
        coalesce(cast(valid_from_year as varchar), '') || ':' ||
        coalesce(cast(valid_to_year as varchar), '') || ':' ||
        coalesce(team_city, '') || ':' || coalesce(team_nickname, '')
    ) as team_history_key,
    team_id,
    team_city,
    team_nickname,
    valid_from_year,
    valid_to_year,
    valid_to_year - valid_from_year + 1 as franchise_identity_duration_years
from BASKETBALL_DEV.staging.stg_team_history