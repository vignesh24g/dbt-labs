{#{% set price=100 %}
  The price is

{% if price>100 %}
    not afforable
{% else %}
    afforable
{% endif %}

{% for j in range(11) %}
    select {{j}} as number {% if not loop.last %} union all {%endif%}
{% endfor %}

{%set var1='haha'%}

{{ var1 }}

#}

{%- set list1 =['a','b','c'] -%}

{{ list1[0] }}


{% for val in list1 %}
  {{val}}
{%- endfor -%}

{% set dict1={
    'a':'hh',
    'b':'jj',
    'c':'kk'
}%}

{{dict1['a']}}