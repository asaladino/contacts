<%@ page import="contacts.Person" %>
<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
<div class="nav" role="navigation">
    <div class="row">
        <div class="large-12 columns">
            <ul class="button-group right">
                <li><a class="home button small" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                <li><g:link class="list button small" action="index">People</g:link></li>
                <li><g:link class="create button small" action="create">Create</g:link></li>
                </ul>
            </div>
        </div>
        <div class="large-12 columns">
            <div id="show-person" class="content scaffold-show" role="main">
                <h2>
                    <g:if test="${personInstance?.firstName}">
                        <span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${personInstance}" field="firstName"/></span>
                    </g:if>

                    <g:if test="${personInstance?.middleName}">
                        <span class="property-value" aria-labelledby="middleName-label"><g:fieldValue bean="${personInstance}" field="middleName"/></span>
                    </g:if>

                    <g:if test="${personInstance?.lastName}">
                        <span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${personInstance}" field="lastName"/></span>
                    </g:if>
                </h2>
                <g:if test="${flash.message}">
                    <div data-alert class="alert-box info radius"><div class="message" role="status">${flash.message}</div></div>
                </g:if>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="large-4 columns">
            <dl class="accordion" data-accordion>
                <dd>
                    <a href="#addresses">Addresses</a>
                    <div id="addresses" class="content active">
                        <g:each in="${personInstance.addresses}" var="a">
                            <ul class="vcard large-12 columns">
                                <li class="street-address"><g:link controller="address" action="show" id="${a.id}">${a?.address1}</g:link></li>
                                <li class="locality">${a?.city}</li>
                                <li><span class="state">${a?.state}</span>, <span class="zip">${a?.zip}</span></li>
                            </ul>
                        </g:each>
                    </div>
                </dd>
            </dl>
        </div>
        <div class="large-4 columns">
            <dl class="accordion" data-accordion>
                <dd>
                    <a href="#emails">Emails</a>
                    <div id="emails" class="content active">
                        <ul class="square">
                        <g:each in="${personInstance.emails}" var="e">
                            <li><span class="property-value" aria-labelledby="emails-label"><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span></li>
                        </g:each>
                        </ul>
                    </div>
                </dd>
            </dl>
        </div>
        <div class="large-4 columns">
            <dl class="accordion" data-accordion>
                <dd>
                    <a href="#phones">Phone Numbers</a>
                    <div id="phones" class="content active">
                        <ul class="square">
                        <g:each in="${personInstance.phones}" var="p">
                            <li><span class="property-value" aria-labelledby="phones-label"><g:link controller="phone" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span></li>
                        </g:each>
                        </ul>
                    </div>
                </dd>
            </dl>
        </div>
    </div>
    <hr/>
    <g:form url="[resource:personInstance, action:'delete']" method="DELETE">
        <ul class="button-group">
            <li><g:link class="edit button small" action="edit" resource="${personInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link></li>
            <li><g:actionSubmit class="delete alert button small" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></li>
        </ul>
    </g:form>
</div>