<%@ page import="contacts.Address" %>
<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />

<div class="row">
    <div class="large-12 columns">
        <ul class="button-group right">
            <li><a class="home button small" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="list button small" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            <li><g:link class="create button small" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
            </ul>
        </div>
    </div>

<div id="show-address" class="content scaffold-show" role="main">
    <h2><g:message code="default.show.label" args="[entityName]" /></h2>
    <g:if test="${flash.message}">
        <div data-alert class="alert-box info radius"><div class="message" role="status">${flash.message}</div></div>
        </g:if>
    <div class="row">
        <div class="columns large-6">
            <ul class="vcard large-12 columns">
                <li class="street-address"><g:link controller="address" action="show" id="${addressInstance.id}">${addressInstance.address1}</g:link></li>
                <li class="locality">${addressInstance.city}</li>
                <li><span class="state">${addressInstance.state}</span>, <span class="zip">${addressInstance.zip}</span></li>
            </ul>
        </div>
        <div class="columns large-6">
            belongs to 
            <g:if test="${addressInstance?.person}">
                <h3>
                    <span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${addressInstance?.person?.id}">${addressInstance?.person?.encodeAsHTML()}</g:link></span>
                </h3>
            </g:if>
        </div>
    </div>
    <hr/>
    <g:form url="[resource:addressInstance, action:'delete']" method="DELETE">
        <g:link class="edit button small" action="edit" resource="${addressInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete button small alert" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
    </g:form>
</div>