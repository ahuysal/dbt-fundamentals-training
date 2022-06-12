{% macro clean_stale_models(database = target.database, schema = target.schema) %}
    
    {% set drop_queries %}

        select case when table_type = 'VIEW' then table_type else 'TABLE' end as drop_type,
        'DROP ' || drop_type || ' ' || table_name || ';' as q
        from {{ database }}.INFORMATION_SCHEMA.TABLES
        where TRUE
        and table_schema = upper('{{ schema }}')

    {%endset%}

    {% set queries = run_query(drop_queries).columns[1].values() %}


    {% for q in queries%}

        {{ log(q, info=TRUE) }}

    {% endfor %}

{% endmacro %}