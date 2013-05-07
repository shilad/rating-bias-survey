package org.grails.poliwikisurvey

import grails.converters.deep.JSON

class ArticleController {

    def index() { }

    def get() {
        render Article.get(params.id) as JSON
    }

    def list() {
        render Article.list() as JSON
    }
}
