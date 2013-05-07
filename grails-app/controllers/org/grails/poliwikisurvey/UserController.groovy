package org.grails.poliwikisurvey
import grails.converters.JSON

class UserController {

    def index() { }


    def create() {
        def user = new User(email: params.email)
        user.save(failOnError:true)
        user.surveyGroup = (user.id % 4)
        def userData = [
            user: user.id,
            userGroup: user.surveyGroup
        ]
        render userData as JSON
    }


    def updateActions = {
        def user = User.get(params.user),
            now = new Date(),
            pageNumber = params.pageNumber
        user.actions.add("${now} - user: ${user.email}, group ${user.surveyGroup}, clicked on: ${params.button} and is now on page ${pageNumber}")
        user.stoppedOnPage = Integer.parseInt(pageNumber)
        user.save(failOnError:true)
        render user as JSON
    }

    def previousResponses = {
        def user = User.get(params.user),
            latestRatings = user.responses.findAll { it.newest == true },
            stars = latestRatings.findAll { it.domId.contains("Star") },
            posNeg = latestRatings.findAll { !it.domId.contains("Star") },
            latest = [
            userGroup: user.surveyGroup,
            posNeg: posNeg,
            stars: stars,
            pageNumber: user.stoppedOnPage
        ]
        render latest as JSON
    }

    def ratedArticles = {
        def user = User.get(params.user);

    }

    def comments = {
        def user = User.get(params.userId)
        user.comments = params.comments
        user.save(failOnError:true)
        render "OK" as String
    }
}
