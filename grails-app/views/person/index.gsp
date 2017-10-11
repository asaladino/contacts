<%@ page import="contacts.Person" %>
<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />

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
        <h2>People</h2>
        <g:if test="${flash.message}">
            <div data-alert class="alert-box info radius"><div class="message" role="status">${flash.message}</div></div>
        </g:if>
        <table class="columns large-12">
            <thead>
                <tr>
                    <g:sortableColumn property="firstName" title="${message(code: 'person.firstName.label', default: 'First Name')}" />
                    <g:sortableColumn property="middleName" title="${message(code: 'person.middleName.label', default: 'Middle Name')}" />
                    <g:sortableColumn property="lastName" title="${message(code: 'person.lastName.label', default: 'Last Name')}" />
                </tr>
            </thead>
            <tbody>
                <g:each in="${personInstanceList}" status="i" var="personInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "firstName")}</g:link></td>
                        <td>${fieldValue(bean: personInstance, field: "middleName")}</td>
                        <td>${fieldValue(bean: personInstance, field: "lastName")}</td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        <div class="pagination">
            <g:paginate total="${personInstanceCount ?: 0}" />
        </div>
    </div>
</div>