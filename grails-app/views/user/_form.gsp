<%@ page import="org.grails.poliwikisurvey.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="user.email.label" default="Email" />

	</label>
	<g:textField name="email" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'responses', 'error')} ">
	<label for="responses">
		<g:message code="user.responses.label" default="Responses" />

	</label>

<ul class="one-to-many">
<g:each in="${userInstance?.responses?}" var="r">
    <li><g:link controller="response" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="response" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'response.label', default: 'Response')])}</g:link>
</li>
</ul>

</div>

%{-- <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'testGroup', 'error')} required">
	<label for="testGroup">
		<g:message code="user.testGroup.label" default="Test Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="testGroup" type="number" value="${userInstance.testGroup}" required=""/>
</div>
 --}%
