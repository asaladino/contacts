<g:set var="entityName" value="${message(code: 'phone.label', default: 'Phone')}" />

<div class="row" role="navigation">
    <div class="columns large-12">
        <ul class="button-group right">
            <li><a class="home button small" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="list button small" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
        </ul>
    </div>
</div>

<div id="create-phone" class="content scaffold-create" role="main">
    <h2><g:message code="default.create.label" args="[entityName]" /></h2>
    <g:if test="${flash.message}">
        <div data-alert class="alert-box info radius"><div class="message" role="status">${flash.message}</div></div>
    </g:if>
    <g:hasErrors bean="${phoneInstance}">
        <div data-alert class="alert-box info radius">
            <ul class="errors" role="alert">
                <g:eachError bean="${phoneInstance}" var="error">
                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
        </div>
    </g:hasErrors>
    <g:form url="[resource:phoneInstance, action:'save']" >
        <g:render template="form"/>
        <hr/>
        <g:submitButton name="create" class="save button small" value="${message(code: 'default.button.create.label', default: 'Create')}" />
    </g:form>
</div>
