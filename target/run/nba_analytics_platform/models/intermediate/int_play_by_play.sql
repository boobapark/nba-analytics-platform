
  create or replace   view BASKETBALL_DEV.intermediate.int_play_by_play
  
   as (
    with ranked_events as (
    select
        *,
        row_number() over (
            partition by game_id, event_number
            order by
                (home_description is not null
                    or neutral_description is not null
                    or away_description is not null) desc,
                (score_text is not null) desc,
                event_type_id nulls last,
                event_action_type_id nulls last
        ) as duplicate_rank
    from BASKETBALL_DEV.staging.stg_play_by_play
)
select
    game_id,
    event_number,
    event_type_id,
    event_action_type_id,
    case event_type_id
        when 1 then 'MADE_SHOT'
        when 2 then 'MISSED_SHOT'
        when 3 then 'FREE_THROW'
        when 4 then 'REBOUND'
        when 5 then 'TURNOVER'
        when 6 then 'FOUL'
        when 7 then 'VIOLATION'
        when 8 then 'SUBSTITUTION'
        when 9 then 'TIMEOUT'
        when 10 then 'JUMP_BALL'
        when 12 then 'PERIOD_END'
        when 13 then 'GAME_END'
        else 'OTHER'
    end as event_category,
    period_number,
    game_clock,
    period_clock,
    home_description,
    neutral_description,
    away_description,
    score_text,
    score_margin,
    player1_id,
    player1_name,
    player1_team_id,
    player2_id,
    player2_name,
    player2_team_id,
    player3_id,
    player3_name,
    player3_team_id,
    video_available
from ranked_events
where duplicate_rank = 1
  );

