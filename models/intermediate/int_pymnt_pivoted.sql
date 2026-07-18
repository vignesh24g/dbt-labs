with
    payments as (
        select * from {{ ref("stg_stripe__payments") }} where payment_status = 'success'
    ),
    pivoted as (
        select
            orderid,
            sum(case when orderid = 1 then amount else 0 end) as bkt_mt,
            sum(case when orderid = 2 then amount else 0 end) as bkt_mt2,
            sum(case when orderid = 3 then amount else 0 end) as bkt_mt3
        from payments
        group by 1
    ),
    pivoted2 as (
        select
            orderid,
            {% set list1=[1,2, 3, 4] %}
            {% for v in list1 %}
                sum(
                    case when orderid={{v}} then amount else 0 end
                ) as bkt_mt{{v}}
                {%- if not loop.last -%}
                    ,
                {%- endif -%}
            {% endfor %}
        from payments
        group by 1
    )
select *
from pivoted2
