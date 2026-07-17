select
 orderid,
 sum(amount) as total
 from {{ ref('stg_stripe__payments') }}
 group by 1
 having sum(amount)<0
