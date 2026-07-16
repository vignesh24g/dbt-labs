select
 orderid ,amount,status as payment_status
from {{ source('stripe', 'payments') }}