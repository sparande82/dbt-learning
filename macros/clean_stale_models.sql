{% macro clean_stale_models(database=target.database, schema=target.schema, days=7, dry_run=True) %}

    {% set get_drop_commands_query %}
        select
            CASE WHEN table_type = 'VIEW' then table_type            
            else 'TABLE' end as drop_type,
            'DROP '||drop_type||' '||TABLE_CATALOG||'.'||TABLE_SCHEMA||'.'||TABLE_NAME||';'
        from {{database}}.INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = UPPER('{{schema}}')
        AND TABLE_CATALOG = UPPER('{{database}}')
        AND LAST_ALTERED < CURRENT_DATE - {{days}}
    {% endset %}

    {{ log('\nGenerating cleanup queries...\n', info=True) }}
    {% set drop_queries = run_query(get_drop_commands_query).columns[1].values() %}

    {% for drop_query in drop_queries %}
        {% if execute and not dry_run %}
            {{ log('Dropping table/view with command: ' ~ drop_query, info=True) }}
            {% do run_query(drop_query) %}    
        {% else %}
            {{ log(drop_query, info=True) }}
        {% endif %}
    {% endfor %}
  {% endmacro %}