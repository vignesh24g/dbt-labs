select
 orderid ,{{ ct("amount")}} as amount,status as payment_status,created
from {{ source('stripe', 'payments') }}