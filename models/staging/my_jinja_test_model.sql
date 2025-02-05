{%- for i in range(10) -%}
select {{i}} {% if not loop.last %} union all {% endif %}
{% endfor -%}

{% set my_name = 'Shreeshail' %}
{{my_name}}

{% set my_favs = ['cake','jamun','pizza','jalebi'] -%}

{% for food in my_favs -%}
    {%- if food == 'pizza' %}
        I like dominos as {{food}}
    {%- else %}
        I like desert as  {{food}}
    {%- endif -%}
{%- endfor -%}

{% set contact = { 'name' : 'Shreeshail','city' : 'Cypress','phone':8573896373} %}
{# Dictionary Values can be accessed in below ways #}
{{ contact.name}}
{{ contact['city'] }}
{{ contact.phone }}