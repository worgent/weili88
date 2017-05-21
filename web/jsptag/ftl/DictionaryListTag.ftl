<#assign list = data.list>

<ul>
<#list list as item>
    <li>
       ${item.name}
    </li>
</#list>
</ul>