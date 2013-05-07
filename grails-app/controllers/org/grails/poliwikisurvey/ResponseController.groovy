package org.grails.poliwikisurvey
import grails.converters.JSON

class ResponseController {

    def index() { }

    //from <g:formRemote url="[action: 'updateResponses']"
    def updateResponses = {
    	def ratingIdString = params.id as String

        def articleId = params.articleId

    	def responseOld = Response.findNewestByRatingId(ratingIdString)
    	if (responseOld) {
    		responseOld.newest = false;
            // do i have to save here?
    	}

    	def user = User.get(params.userId as long)
    	def response = new Response(ratingId: ratingIdString, domId: params.domId, value: params.ratingValue as int, newest: true, user: user, article:Article.get(articleId))

    	response.save(failOnError: true)
    	user.addToResponses(response).save(failOnError:true)

        render response as JSON
    }

}
