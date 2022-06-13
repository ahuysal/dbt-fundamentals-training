{% macro template_example() %}
    
    {% set query %}
        select true as bool
    {% endset %}

    {% if execute%}
        {% set result = run_query(query).columns[0].values()[0] %}
        {{ log('SQL results ' ~ result, info=True)}}

        select 
          {{ result }} as is_real
    
    {%endif%}

{% endmacro %}