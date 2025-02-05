with rec_cnt as (select count(1) as cnt
from {{ ref("my_first_int_model") }}
)
select * from rec_cnt where cnt > 1