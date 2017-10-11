<%@ page import="contacts.Email" %>
<g:set var="entityName" value="${message(code: 'email.label', default: 'Email')}" />

<div class="row">
    <div class="large-12 columns">
        <ul class="button-group right">
            <li><a class="home button small" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="list button small" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            <li><g:link class="create button small" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
</div>

<div id="show-email" class="content scaffold-show" role="main">
    <h2><g:message code="default.show.label" args="[entityName]" /></h2>
    <g:if test="${flash.message}">
        <div data-alert class="alert-box info radius"><div class="message" role="status">${flash.message}</div></div>
    </g:if>
    <h3 class="subheader">
        <g:if test="${emailInstance?.address}">
            <span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${emailInstance}" field="address"/></span> belongs to 
        </g:if>

        <g:if test="${emailInstance?.person}">
            <span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${emailInstance?.person?.id}">${emailInstance?.person?.encodeAsHTML()}</g:link></span>
        </g:if>
    </h3>
    <hr/>
    <g:form url="[resource:emailInstance, action:'delete']" method="DELETE">
        <ul class="button-group">
            <li><g:link class="edit button small" action="edit" resource="${emailInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link></li>
            <li><g:actionSubmit class="delete button small alert" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></li>
        </ul>
    </g:form>
</div>