<%@ page import="contacts.Address" %>
<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />

<div class="row">
    <div class="large-12 columns">
        <ul class="button-group right">
            <li><a class="home button small" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="create button small" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
</div>
<div id="list-address" class="content scaffold-list" role="main">
    <h2><g:message code="default.list.label" args="[entityName]" /></h2>
    <g:if test="${flash.message}">
        <div data-alert class="alert-box info radius"><div class="message" role="status">${flash.message}</div></div>
    </g:if>
    <table class="columns large-12">
        <thead>
            <tr>
                <g:sortableColumn property="address1" title="${message(code: 'address.address1.label', default: 'Address1')}" />
                <g:sortableColumn property="address2" title="${message(code: 'address.address2.label', default: 'Address2')}" />
                <g:sortableColumn property="city" title="${message(code: 'address.city.label', default: 'City')}" />
                <g:sortableColumn property="country" title="${message(code: 'address.country.label', default: 'Country')}" />
                <g:sortableColumn property="state" title="${message(code: 'address.state.label', default: 'State')}" />
                <th><g:message code="address.person.label" default="Person" /></th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${addressInstanceList}" status="i" var="addressInstance">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean: addressInstance, field: "address1")}</g:link></td>
                    <td>${fieldValue(bean: addressInstance, field: "address2")}</td>
                    <td>${fieldValue(bean: addressInstance, field: "city")}</td>
                    <td>${fieldValue(bean: addressInstance, field: "country")}</td>
                    <td>${fieldValue(bean: addressInstance, field: "state")}</td>
                    <td>${fieldValue(bean: addressInstance, field: "person")}</td>
                </tr>
            </g:each>
        </tbody>
    </table>
    <div class="pagination">
        <g:paginate total="${addressInstanceCount ?: 0}" />
    </div>
</div>