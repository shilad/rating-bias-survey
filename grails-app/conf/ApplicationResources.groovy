modules = {
    application {
        dependsOn 'jquery', 'handlebars'
		resource url:'js/plugins.js'
        resource url:'js/jquery.cookie.js'
        resource url:'js/jquery.placeholder.js'
        resource url:'js/jquery.tooltipster.min.js'
        // resource url:'js/main.js'
        resource url:'js/application.js'
    }
    mainpage {
        resource url:'js/main.js'
    }
    modernizr {
        resource url:'js/modernizr-2.6.1-respond-1.1.0.min.js', disposition: 'head'
    }
    handlebars {
    	resource url:'js/handlebars.js'
    }
}
