<%@ page import="contacts.Country" %>
<g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />

<div class="nav" role="navigation">
    <ul>
        <li><a class="home button small" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create button small" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
    <div id="list-country" class="content scaffold-list" role="main">
        <h2><g:message code="default.list.label" args="[entityName]" /></h2>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table class="large-12 columns">
        <thead>
            <tr>

                <g:sortableColumn property="abbrv" title="${message(code: 'country.abbrv.label', default: 'Abbrv')}" />

                <g:sortableColumn property="description" title="${message(code: 'country.description.label', default: 'Description')}" />

                <g:sortableColumn property="formOfGovernment" title="${message(code: 'country.formOfGovernment.label', default: 'Form Of Government')}" />

                <g:sortableColumn property="name" title="${message(code: 'country.name.label', default: 'Name')}" />

                <g:sortableColumn property="nationalBird" title="${message(code: 'country.nationalBird.label', default: 'National Bird')}" />

            </tr>
        </thead>
        <tbody>
            <g:each in="${countryInstanceList}" status="i" var="countryInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                    <td><g:link action="show" id="${countryInstance.id}">${fieldValue(bean: countryInstance, field: "abbrv")}</g:link></td>

                    <td>${fieldValue(bean: countryInstance, field: "description")}</td>

                    <td>${fieldValue(bean: countryInstance, field: "formOfGovernment")}</td>

                    <td>${fieldValue(bean: countryInstance, field: "name")}</td>

                    <td>${fieldValue(bean: countryInstance, field: "nationalBird")}</td>

                </tr>
            </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${countryInstanceCount ?: 0}" />
    </div>
</div>