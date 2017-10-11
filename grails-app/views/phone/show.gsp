<%@ page import="contacts.Phone" %>
<g:set var="entityName" value="${message(code: 'phone.label', default: 'Phone')}" />

<div class="row">
    <div class="large-12 columns">
        <ul class="button-group right">
            <li><a class="home button small" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="list button small" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            <li><g:link class="create button small" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
</div>

<div id="show-phone" class="content scaffold-show" role="main">
    <h2><g:message code="default.show.label" args="[entityName]" /></h2>
    <g:if test="${flash.message}">
        <div data-alert class="alert-box info radius"><div class="message" role="status">${flash.message}</div></div>
    </g:if>

    <h3 class="subheader">
        <g:if test="${phoneInstance?.number}">
            <span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${phoneInstance}" field="number"/></span> belongs to 
        </g:if>

        <g:if test="${phoneInstance?.person}">
            <span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${phoneInstance?.person?.id}">${phoneInstance?.person?.encodeAsHTML()}</g:link></span>
        </g:if>
    </h3>

    <hr/>
    <g:form url="[resource:phoneInstance, action:'delete']" method="DELETE">
        <g:link class="edit button small" action="edit" resource="${phoneInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete button small alert" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
    </g:form>
</div>