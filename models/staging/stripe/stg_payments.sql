with payments as (
    select
        orderid as order_id,
        sum(amount) as amount
    from (select * from RAW.STRIPE.PAYMENT where status = 'success')
    group by 1
)

select * from payments