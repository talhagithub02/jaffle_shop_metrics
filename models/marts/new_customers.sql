select *
from {{ 
    metrics.calculate(
        metric('rolling_new_customers'),
        
        dimensions=['first_name']
    )
}}