with orders as ( 

    select * from {{ ref('stg_jaffle_shop__orders') }}

),

payments as ( 

    select * from {{ ref('stg_stripe__payments') }}

),

final as(

    select o.order_id as order_id,
    o.customer_id as customer_id,
    p.amount as amount,p.payment_status

    from orders o
    inner join payments  p
     on o.order_id=p.orderid 
)

select * from final