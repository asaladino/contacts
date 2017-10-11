<%@ page import="contacts.Phone" %>
<g:set var="entityName" value="${message(code: 'phone.label', default: 'Phone')}" />

<div class="row">
    <div class="large-12 columns">
        <ul class="button-group right">
            <li><a class="home button small" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="create button small" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="large-12 columns">
        <div id="list-phone" class="content scaffold-list" role="main">
            <h2><g:message code="default.list.label" args="[entityName]" /></h2>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table class="columns large-12">
                <thead>
                    <tr>
                        <g:sortableColumn property="number" title="${message(code: 'phone.number.label', default: 'Number')}" />
                        <th><g:message code="phone.person.label" default="Person" /></th>
                    </tr>
                </thead>
                <tbody>
                    <g:each in="${phoneInstanceList}" status="i" var="phoneInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td><g:link action="show" id="${phoneInstance.id}">${fieldValue(bean: phoneInstance, field: "number")}</g:link></td>
                            <td>${fieldValue(bean: phoneInstance, field: "person")}</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${phoneInstanceCount ?: 0}" />
            </div>
        </div>
    </div>
</div>