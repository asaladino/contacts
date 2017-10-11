<%@ page import="contacts.Email" %>

<div class="row">
    <div class="columns large-6">
        <div class="fieldcontain ${hasErrors(bean: emailInstance, field: 'address', 'error')} ">
            <label for="address">
                <g:message code="email.address.label" default="Address" />

            </label>
            <g:textField name="address" value="${emailInstance?.address}"/>
        </div>
    </div>
    <div class="columns large-6">
        <div class="fieldcontain ${hasErrors(bean: emailInstance, field: 'person', 'error')} required">
            <label for="person">
                <g:message code="email.person.label" default="Person" />
                <span class="required-indicator">*</span>
            </label>
            <g:select id="person" name="person.id" from="${contacts.Person.list()}" optionKey="id" required="" value="${emailInstance?.person?.id}" class="many-to-one"/>
        </div>
    </div>
</div>