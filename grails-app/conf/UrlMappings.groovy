class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
//		"/"(view:"/index")
                "/"(controller:"login", action:"companyLogin")
		"500"(view:'/error')
	}
}
