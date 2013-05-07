<%@ page import="org.grails.poliwikisurvey.Response" %>



<div class="fieldcontain ${hasErrors(bean: responseInstance, field: 'answer', 'error')} ">
	<label for="answer">
		<g:message code="response.answer.label" default="Answer" />
		
	</label>
	<g:textField name="answer" value="${responseInstance?.answer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: responseInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="response.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${org.grails.poliwikisurvey.User.list()}" optionKey="id" required="" value="${responseInstance?.author?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: responseInstance, field: 'question', 'error')} ">
	<label for="question">
		<g:message code="response.question.label" default="Question" />
		
	</label>
	<g:textField name="question" value="${responseInstance?.question}"/>
</div>

