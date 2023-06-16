with orders as (
    select
         order_id
        ,customer_id
    from {{ ref('stg_orders') }}
)
,payments as (
    select
        *
    from {{ ref('stg_payments') }}
)
,joined as (
    select
         o.order_id
        ,o.customer_id
        ,p.amount
    from orders o
    inner join payments p
    using (order_id)
)
select
    *
from joined
