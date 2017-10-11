<%@ page import="contacts.Email" %>
<g:set var="entityName" value="${message(code: 'email.label', default: 'Email')}" />

<div class="row">
    <div class="large-12 columns">
        <ul class="button-group right">
            <li><a class="home button small" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="create button small" action="create">Create</g:link></li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="large-12 columns">
        <h2><g:message code="default.list.label" args="[entityName]" /></h2>
        <g:if test="${flash.message}">
            <div data-alert class="alert-box info radius"><div class="message" role="status">${flash.message}</div></div>
        </g:if>
        <table class="columns large-12">
            <thead>
                <tr>
                    <g:sortableColumn property="address" title="${message(code: 'email.address.label', default: 'Address')}" />
                    <th><g:message code="email.person.label" default="Person" /></th>
                </tr>
            </thead>
            <tbody>
                <g:each in="${emailInstanceList}" status="i" var="emailInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><g:link action="show" id="${emailInstance.id}">${fieldValue(bean: emailInstance, field: "address")}</g:link></td>
                        <td>${fieldValue(bean: emailInstance, field: "person")}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${emailInstanceCount ?: 0}" />
        </div>
    </div>
</div>