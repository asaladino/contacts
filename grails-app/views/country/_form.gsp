<%@ page import="contacts.Country" %>



<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'abbrv', 'error')} ">
	<label for="abbrv">
		<g:message code="country.abbrv.label" default="Abbrv" />
		
	</label>
	<g:textField name="abbrv" value="${countryInstance?.abbrv}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="country.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${countryInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'formOfGovernment', 'error')} ">
	<label for="formOfGovernment">
		<g:message code="country.formOfGovernment.label" default="Form Of Government" />
		
	</label>
	<g:textField name="formOfGovernment" value="${countryInstance?.formOfGovernment}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="country.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${countryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'nationalBird', 'error')} ">
	<label for="nationalBird">
		<g:message code="country.nationalBird.label" default="National Bird" />
		
	</label>
	<g:textField name="nationalBird" value="${countryInstance?.nationalBird}"/>
</div>

