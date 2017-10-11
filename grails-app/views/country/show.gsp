
<%@ page import="contacts.Country" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'country.label', default: 'Country')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-country" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-country" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list country">
			
				<g:if test="${countryInstance?.abbrv}">
				<li class="fieldcontain">
					<span id="abbrv-label" class="property-label"><g:message code="country.abbrv.label" default="Abbrv" /></span>
					
						<span class="property-value" aria-labelledby="abbrv-label"><g:fieldValue bean="${countryInstance}" field="abbrv"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="country.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${countryInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.formOfGovernment}">
				<li class="fieldcontain">
					<span id="formOfGovernment-label" class="property-label"><g:message code="country.formOfGovernment.label" default="Form Of Government" /></span>
					
						<span class="property-value" aria-labelledby="formOfGovernment-label"><g:fieldValue bean="${countryInstance}" field="formOfGovernment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="country.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${countryInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${countryInstance?.nationalBird}">
				<li class="fieldcontain">
					<span id="nationalBird-label" class="property-label"><g:message code="country.nationalBird.label" default="National Bird" /></span>
					
						<span class="property-value" aria-labelledby="nationalBird-label"><g:fieldValue bean="${countryInstance}" field="nationalBird"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:countryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${countryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
