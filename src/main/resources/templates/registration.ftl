<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
Registration page
<div>
<#if message?has_content>
    ${message}
</#if>
</div>
<@l.login "/registration" />
<div>
<a href="/login">Go back to login page</a>
</div>
</@c.page>