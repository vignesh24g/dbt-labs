select
 orderid ,amount,status as payment_status,created
from {{ source('stripe', 'payments') }}