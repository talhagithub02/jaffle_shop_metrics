select
  payment_id,
  {{ cents_to_dollars('amount') }} as amount_usd
from {{ ref('stg_payments') }}