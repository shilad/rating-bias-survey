package org.grails.poliwikisurvey

import javax.servlet.http.Cookie

class User {

    String email
    String comments = ""
    int surveyGroup = 4
    int stoppedOnPage = 1
    def actions = []
    static hasMany = [responses: Response]

    static constraints = {
    	email(nullable:false)
    }
}
