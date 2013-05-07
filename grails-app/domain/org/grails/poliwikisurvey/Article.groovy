package org.grails.poliwikisurvey

class Article {
    String title
    String pullFrom
    String agreementQuestion
    String content

    static constraints = {
    }

    static mapping = {
        title type : 'text'
        content type : 'text'
    }
}
