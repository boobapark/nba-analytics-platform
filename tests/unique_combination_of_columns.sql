{% test unique_combination_of_columns(model, column_names) %}

select
    {% for column in column_names %}
        {{ adapter.quote(column) }}{% if not loop.last %}, {% endif %}
    {% endfor %},
    count(*) as duplicate_count
from {{ model }}
group by
    {% for column in column_names %}
        {{ adapter.quote(column) }}{% if not loop.last %}, {% endif %}
    {% endfor %}
having count(*) > 1

{% endtest %}
