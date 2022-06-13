{% macro grant_select(schema = target.schema, role = 'accountadmin') %}

    {% set sql %}
        grant usage on schema {{ schema }} to role {{ role }};
        grant select on all tables in schema {{ schema }} to role {{ role }};
        grant select on all views in schema {{ schema }} to role {{ role }};
    {%endset%}
    
    {{ log('Running grant queries on ' ~ schema ~ ' to role ' ~ role, info=True) }}
    {% do run_query(sql) %}
    {{ log('Select on all tables and views granted', info=True) }}

{% endmacro %}