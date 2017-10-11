<%@ page import="contacts.Address" %>
<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />

<div class="row" role="navigation">
    <div class="columns large-12">
        <ul class="button-group right">
            <li><a class="home button small" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="list button small" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            <li><g:link class="create button small" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
</div>

<div id="edit-address" class="content scaffold-edit" role="main">
    <h2><g:message code="default.edit.label" args="[entityName]" /></h2>
    <g:if test="${flash.message}">
        <div data-alert class="alert-box info radius"><div class="message" role="status">${flash.message}</div></div>
    </g:if>
    <g:hasErrors bean="${addressInstance}">
        <div data-alert class="alert-box info radius">
            <ul class="errors" role="alert">
                <g:eachError bean="${addressInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>
    <g:form url="[resource:addressInstance, action:'update']" method="PUT" >
        <g:hiddenField name="version" value="${addressInstance?.version}" />
        <g:render template="form"/>
        <hr/>
        <g:actionSubmit class="save button small" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
    </g:form>
</div>