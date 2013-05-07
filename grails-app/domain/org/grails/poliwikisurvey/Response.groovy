package org.grails.poliwikisurvey

class Response {

    String ratingId
    String domId
    int value
    boolean newest
    Date dateCreated
    static belongsTo = [user:User]

    static constraints = {
    }



}
