{% snapshot orders_snapshot %}

{{
    config(
  
      unique_key='id',

      strategy='timestamp',
      updated_at='order_date',
	  target_schema='public'
    )
}}

select *  from {{ ref('raw_orders') }}

{% endsnapshot %}