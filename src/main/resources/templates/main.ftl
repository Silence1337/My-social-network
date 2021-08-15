<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<div>
    <@l.logout />
    <#if isAdmin?has_content>
        <#if isAdmin == true>
            <span><a href="/user">User list</a></span>
        </#if>
    </#if>
</div>
    <div>
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <input type="text" name="text" placeholder="Введите сообщение" />
            <input type="text" name="tag" placeholder="Тэг" />
            <button type="submit">Отправить сообщение</button>
        </form>
    </div>
    <div>Поиск сообщений по тэгу:</div>
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter}">
        <button type="submit">Найти</button>
    </form>
        <#list messages as message>
            <div>
                <#if isAdmin == true>
                    <span><a href="/message/${message.id}">edit message</a></span>
                </#if>
                <strong>[${message.authorName}]:</strong>
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
        <#else>
            No messages
        </#list>
</@c.page>