{% set results = run_query('select 1 as id') %}
{{ config(alias='orderStaging',schema='dbt_test') }}

with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ source('public','order') }}

),
source_2 as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ source('public','customer') }}

),
source_3 as (

    select * from {{ ref('stg_customers') }}

),
source_4 as (

    select user_id from {{ ref('raw_orders') }}

),


renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from source
	where order_date in ('{{ var("start_date") }}')

)

select * from renamed
