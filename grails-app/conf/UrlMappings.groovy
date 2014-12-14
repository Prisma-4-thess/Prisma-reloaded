class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "/admin_panel"(view:"/admin_panel")
        "500"(view:'/error')
	}
}
