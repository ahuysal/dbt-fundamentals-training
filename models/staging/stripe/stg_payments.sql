with payments as (
    select
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount,
        {{cents_to_dollars('amount')}} as amount_in_dollars
    from {{ source('stripe', 'payment') }}
)

select * from payments