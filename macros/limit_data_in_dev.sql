{% macro limit_data_in_dev(column_name) -%}
where {{column_name}} > dateadd('month', -48, current_date)
{%- endmacro %}