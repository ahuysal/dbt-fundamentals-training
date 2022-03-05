with payments as (
    select
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount
    from {{ source('stripe', 'payment') }}
)

select * from payments