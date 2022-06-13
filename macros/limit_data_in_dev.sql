{% macro limit_data_in_dev(column_name, period, duration) -%}
where {{column_name}} > dateadd({{ period }}, -{{ duration }}, current_date)
{%- endmacro %}