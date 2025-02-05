{% test my_first_generic_test(model, column_name) %}
with rec_cnt as (select count(1) as cnt
from {{ model }}
)
select * from rec_cnt where cnt < 1
{% endtest %}