<#assign list = data.list>

<div>${data.typeName!}:</div>
<#list list as item>
     <span><input type="radio" name="${data.name!}" value="${item.id}"/>${item.name}</span>&nbsp;&nbsp;
</#list>
