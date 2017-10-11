<%@ page import="contacts.Person" %>
<div class="row">
    <div class="columns large-3">
        <div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} ">
            <label for="firstName">
                <g:message code="person.firstName.label" default="First Name" />
            </label>
            <g:textField name="firstName" value="${personInstance?.firstName}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: personInstance, field: 'middleName', 'error')} ">
            <label for="middleName">
                <g:message code="person.middleName.label" default="Middle Name" />

            </label>
            <g:textField name="middleName" value="${personInstance?.middleName}"/>
        </div>

        <div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} ">
            <label for="lastName">
                <g:message code="person.lastName.label" default="Last Name" />
            </label>
            <g:textField name="lastName" value="${personInstance?.lastName}"/>
        </div>
    </div>
    <div class="columns large-9">
        <div class="row">
            <div class="columns large-4">
                <dl class="accordion" data-accordion>
                    <dd>
                        <a href="#addresses">Addresses</a>
                        <div id="addresses" class="content active">
                            <a href="#/address-modal"  data-reveal-id="address-edit-modal" class="button tiny right">Add Address</a>
                            <!--<g:link controller="address" class="button tiny right" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'address.label', default: 'Address')])}</g:link>-->
                            <div id="address-list">
                                <g:each in="${personInstance?.addresses}" var="a">
                                    <ul class="vcard large-12 columns">
                                        <li class="street-address"><g:link controller="address" action="show" id="${a.id}">${a?.address1}</g:link></li>
                                        <li class="locality">${a?.city}</li>
                                        <li><span class="state">${a?.state}</span>, <span class="zip">${a?.zip}</span></li>
                                    </ul>
                                </g:each>
                            </div>
                        </div>
                    </dd>
                </dl>
            </div>

            <div class="columns large-4">
                <dl class="accordion" data-accordion>
                    <dd>
                        <a href="#emails">Emails</a>
                        <div id="emails" class="content active">
                            <a href="#/email-modal"  data-reveal-id="email-edit-modal" class="button tiny right">Add Email</a>
                            <!--<g:link controller="email" class="button tiny right" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'email.label', default: 'Email')])}</g:link>-->
                            <ul class="square columns large-12" id="email-list">
                                <g:each in="${personInstance?.emails?}" var="e">
                                    <li><span class="property-value" aria-labelledby="emails-label"><g:link controller="email" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span></li>
                                </g:each>
                            </ul>
                        </div>
                    </dd>
                </dl>
            </div>

            <div class="columns large-4">
                <dl class="accordion" data-accordion>
                    <dd>
                        <a href="#phones">Phone Numbers</a>
                        <div id="phones" class="content active">
                            <a href="#/phone-modal"  data-reveal-id="phone-edit-modal" class="button tiny right">Add Phone</a>
                            <!--<g:link controller="phone" class="button tiny right" action="create" params="['person.id': personInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'phone.label', default: 'Phone')])}</g:link>-->
                            <ul class="square columns large-12" id="phone-number-list">
                                <g:each in="${personInstance?.phones?}" var="p">
                                    <li><span class="property-value" aria-labelledby="phones-label"><g:link controller="phone" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span></li>
                                </g:each>
                            </ul>
                        </div>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
</div>

<div id="address-edit-modal" class="reveal-modal large" data-reveal>
    <h4>Add Address</h4>
    <g:render template="/address/form" model="address" />
    <hr/>
    <a href="#/address-create" id="address-create" class="button small right">Create</a>
    <script type="text/javascript">
        $(document).ready(function() {
            var AddresshowLink = '<g:createLink controller="address" action="show" />';
            $('#address-create').click(function() {
                $.ajax('<g:createLink controller="address" action="save.json" />', {
                    processData: false,
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        'address1': $('#address-edit-modal #address1').val(),
                        'address2': $('#address-edit-modal #address2').val(),
                        'city': $('#address-edit-modal #city').val(),
                        'state': $('#address-edit-modal #state').val(),
                        'zip': $('#address-edit-modal #zip').val(),
                        'country': $('#address-edit-modal #country').val(),
                        'person': {
                            'id': $('#address-edit-modal #person').val()
                        }
                    }),
                }).done(function(data){
                    $('#address-edit-modal').foundation('reveal', 'close');
                    $('#address-list').append('<ul class="vcard large-12 columns"><li><a href="' + AddresshowLink + '/' + data.id + '">' + data.address1 + '</a></li><li class="locality">' + data.city + '</li><li><span class="state">' + data.state + '</span>, <span class="zip">' + data.zip + '</span></li></ul>');
                    console.log(data);
                }).error(function(data){
                    $('#address-edit-modal').foundation('reveal', 'close');
                    console.log(data);
                });
            });
        });
    </script>
</div>


<div id="email-edit-modal" class="reveal-modal small" data-reveal>
    <h4>Add Email</h4>
    <g:render template="/email/form" model="email" />
    <hr/>
    <a href="#/email-create" id="email-create" class="button small right">Create</a>
    <script type="text/javascript">
        $(document).ready(function() {
            var EmailShowLink = '<g:createLink controller="email" action="show" />';
            $('#email-create').click(function() {
                $.ajax('<g:createLink controller="email" action="save.json" />', {
                    processData: false,
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        'address': $('#email-edit-modal #address').val(),
                        'person': {
                            'id': $('#email-edit-modal #person').val()
                        }
                    }),
                }).done(function(data){
                    $('#email-edit-modal').foundation('reveal', 'close');
                    $('#email-list').append('<li><a href="' + EmailShowLink + '/' + data.id + '">' + $('#email-edit-modal #address').val() + '</a></li>');
                    console.log(data);
                }).error(function(data){
                    $('#email-edit-modal').foundation('reveal', 'close');
                    console.log(data);
                });
            });
        });
    </script>
</div>


<div id="phone-edit-modal" class="reveal-modal small" data-reveal>
    <h4>Add Phone</h4>
    <g:render template="/phone/form" model="phone" />
    <hr/>
    <a href="#/phone-create" id="phone-create" class="button small right">Create</a>
    <script type="text/javascript">
        $(document).ready(function() {
            var PhoneShowLink = '<g:createLink controller="phone" action="show" />';
            $('#phone-create').click(function() {
                $.ajax('<g:createLink controller="phone" action="save.json" />', {
                    processData: false,
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        'number': $('#phone-edit-modal #number').val(),
                        'person': {
                            'id': $('#phone-edit-modal #person').val()
                        }
                    }),
                }).done(function(data){
                    $('#phone-edit-modal').foundation('reveal', 'close');
                    $('#phone-number-list').append('<li><a href="' + PhoneShowLink + '/' + data.id + '">' + $('#phone-edit-modal #number').val() + '</a></li>');
                    console.log(data);
                }).error(function(data){
                    $('#phone-edit-modal').foundation('reveal', 'close');
                    console.log(data);
                });
            });
        });
    </script>
</div>

<div></div>