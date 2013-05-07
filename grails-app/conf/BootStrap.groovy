
import org.json.simple.JSONObject
import grails.converters.deep.JSON
import org.codehaus.groovy.grails.web.json.JSONElement
import org.grails.poliwikisurvey.Article

class BootStrap {

    def init = { servletContext ->

        JSONElement articles = JSON.parse(new File("dat/articles.json").getText("UTF-8"));
        for (JSONObject article : articles) {
            println("keys are " + article.keySet())
            Article a = new Article()
            a.setProperties(article)
            a.save()
        }
    }
}
