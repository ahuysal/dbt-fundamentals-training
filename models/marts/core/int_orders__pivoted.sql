{%- set payment_methods = ['credit_card', 'coupon', 'bank_transfer', 'gift_card'] -%}

with payment as (

    select * from {{ ref('stg_payments') }}

),

pivoted_payment as (

    select 
        order_id,
        {% for method in payment_methods -%}

        sum(case when payment_method = '{{ method }}' then amount else 0 end) as {{ method }}_total
        
        {%- if not loop.last -%}
        ,
        {% endif -%}

        {%- endfor -%}

    from payment
    where status = 'success'
    group by 1
)

select * from pivoted_payment
