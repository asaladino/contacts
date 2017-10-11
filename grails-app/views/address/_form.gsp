<%@ page import="contacts.Address" %>

<div class="row">
    <div class="columns large-6">
        <div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'address1', 'error')} ">
            <label for="address1">
                <g:message code="address.address1.label" default="Address1" />
            </label>
            <g:textField name="address1" value="${addressInstance?.address1}"/>
        </div>
        
        <div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'address2', 'error')} ">
            <label for="address2">
                <g:message code="address.address2.label" default="Address2" />
            </label>
            <g:textField name="address2" value="${addressInstance?.address2}"/>
        </div>

        <div class="row">
            <div class="columns large-8">
                <div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} ">
                    <label for="city">
                        <g:message code="address.city.label" default="City" />
                    </label>
                    <g:textField name="city" value="${addressInstance?.city}"/>
                </div>
            </div>
            <div class="columns large-2">
                <div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'state', 'error')} ">
                    <label for="state">
                        <g:message code="address.state.label" default="State" />
                    </label>
                    <g:textField name="state" value="${addressInstance?.state}"/>
                </div>
            </div>
            <div class="columns large-2">
                <div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'zip', 'error')} ">
                    <label for="zip">
                        <g:message code="address.zip.label" default="Zip" />
                    </label>
                    <g:textField name="zip" value="${addressInstance?.zip}"/>
                </div>
            </div>
        </div>

        <div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'country', 'error')} ">
            <label for="country">
                <g:message code="address.country.label" default="Country" />
            </label>
            <g:textField name="country" value="${addressInstance?.country}"/>
        </div>
    </div>

    <div class="columns large-6">
        <div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'person', 'error')} required">
            <label for="person">
                <g:message code="address.person.label" default="Person" />
                <span class="required-indicator">*</span>
            </label>
            <g:select id="person" name="person.id" from="${contacts.Person.list()}" optionKey="id" required="" value="${addressInstance?.person?.id}" class="many-to-one"/>
        </div>
    </div>
</div>