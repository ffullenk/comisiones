class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :determine_layout

  def determine_layout
   
   
   if vendedor_signed_in? || empresa_signed_in?
     "application"
   else
     "masthead"
   end
 end


end
