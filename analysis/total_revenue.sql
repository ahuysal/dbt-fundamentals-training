with success_payment as (

    select sum(amount) as total_amount from {{ ref('stg_payments') }}

)

select * from success_payment