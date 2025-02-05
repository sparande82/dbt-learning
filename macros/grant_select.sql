
{# we can run the macros alone with the command: dbt run-opeartion macroname
example: dbt run-operation grant_select #}
{% macro grant_select(schema=target.schema,role='etl_user_role') -%}
  {% set grantquery -%}
        grant usage on schema {{ schema }} to role {{role}};
        grant select on all tables in schema {{schema}} to role {{role}};
        grant select on all views in schema {{ schema }} to role {{role}};
  {% endset -%}
   {{ log('Granting Permissions to schema '~ schema~ ' to role ' ~role, info=True )}}

   {% do run_query(grantquery) %}

    {{ log('Permissions Granted Successfully to schema '~ schema~ ' to role ' ~role, info=True )}}
{% endmacro -%}