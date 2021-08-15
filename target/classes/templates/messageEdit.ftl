<#import "parts/common.ftl" as c>

<@c.page>
Message editor

<form action="/message" method="post">
    <input type="text" name="text" value="${message.text}">
    <input type="text" name="tag" value="${message.tag}">

    <input type="hidden" value="${message.id}" name="messageId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button type="submit">Save</button>
</form>

<form action="/message/delete" method="post">
    <input type="hidden" value="${message.id}" name="messageId">
    <input type="hidden" value="${_csrf.token}" name="_csrf">
    <button type="submit">delete message</button>
</form>
</@c.page>