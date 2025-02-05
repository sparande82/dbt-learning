{% macro fn_pct_calc(value_column,rnd_digits=2) -%}
    round({{value_column}}/100,{{rnd_digits}})
{%- endmacro -%}

{% macro fn_avg_calc(value_column) -%}
    avg({{value_column}})
{%- endmacro -%}