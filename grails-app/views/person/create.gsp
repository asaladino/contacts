<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />

<div class="row" role="navigation">
    <div class="columns large-12">
        <ul class="button-group right">
            <li><a class="home button small" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="list button small" action="index">People</g:link></li>
        </ul>
    </div>
</div>

<div class="row">
    <div class="columns large-12">
        <h2><g:message code="default.edit.label" args="[entityName]" /></h2>
        <g:if test="${flash.message}">
            <div data-alert class="alert-box info radius"><div class="message" role="status">${flash.message}</div></div>
        </g:if>
        <g:hasErrors bean="${personInstance}">
            <div data-alert class="alert-box info radius">
                <ul class="errors" role="alert">
                    <g:eachError bean="${personInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </div>
        </g:hasErrors>

        <g:form url="[resource:personInstance, action:'save']" >
            <g:render template="form"/>
            <hr/>
            <g:submitButton name="create" class="save button small" value="${message(code: 'default.button.create.label', default: 'Create')}" />
        </g:form>
    </div>
</div>