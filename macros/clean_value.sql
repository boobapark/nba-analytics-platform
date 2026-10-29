{% macro clean_value(expression) -%}
nullif(trim(cast({{ expression }} as varchar)), '')
{%- endmacro %}

{% macro safe_integer(expression) -%}
try_cast({{ clean_value(expression) }} as bigint)
{%- endmacro %}

{% macro safe_decimal(expression) -%}
try_cast({{ clean_value(expression) }} as double)
{%- endmacro %}

{% macro safe_date(expression) -%}
try_cast({{ clean_value(expression) }} as date)
{%- endmacro %}

{% macro safe_boolean(expression) -%}
case
    when lower({{ clean_value(expression) }}) in ('true', '1', 'yes', 'y') then true
    when lower({{ clean_value(expression) }}) in ('false', '0', 'no', 'n') then false
    else null
end
{%- endmacro %}
