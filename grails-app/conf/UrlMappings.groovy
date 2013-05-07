class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/startpage")
		"/start"(view:"/startpage")
		"/consent"(view:"consent")
		"/finish"(view:"finish")
		"500"(view:'/error')
	}
}
