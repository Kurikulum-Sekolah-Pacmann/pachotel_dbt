{% test is_rating_less_than_zero(model, column_name) %}

with rating as (
    
    select {{ column_name }}::numeric as rating_data
    from {{ model }}
),

check_rating as (
    select 
        rating_data
    from
        rating
    where
        rating_data < 0
)

select * from check_rating

{% endtest %}