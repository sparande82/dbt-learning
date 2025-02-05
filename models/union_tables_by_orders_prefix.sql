
select 1 as dummy
{# we can build a models by invoking the macro to union all the tables starting with orders_ 
{{ union_tables_by_prefix(
      database='raw',
      schema='dbt_learn_jinja', 
      prefix='orders__'
      )
 }}
  #}