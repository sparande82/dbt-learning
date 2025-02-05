with emp as (
    select '100' as emp_id, 9856 as salary union all
    select '101' as emp_id, 5678 as salary union all
    select '102' as emp_id, 4568 as salary union all
    select '103' as emp_id, 8989 as salary union all
    select '104' as emp_id, 2367 as salary 
) select {{dbt_utils.generate_surrogate_key(['emp_id','salary'])}} as emp_sk,
emp_id,salary,
{{fn_pct_calc('salary',4)}} as pct_salary
from emp