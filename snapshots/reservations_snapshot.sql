{% snapshot reservations_snapshot %}

{{
    config(
        target_database="pachotel_dbt",
        target_schema="pachotel_snapshots",
        unique_key="sk_reservation_id",

        strategy="timestamp",
        updated_at="updated_at"
    )
}}

select *
from {{ ref("fct_reservations") }} 

{% endsnapshot %}