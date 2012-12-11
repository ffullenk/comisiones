module ApplicationHelper

 def usuario_signed_in?
 	
 	return (vendedor_signed_in? && empresa_signed_in?)

 end


 def render_masthead?

 	controllers = ["home", "sessions",  "registrations", "passwords"]

 return (controllers.include? (controller_name) ||  ((controller_name.eql? "productos") && !usuario_signed_in?))
 end


end