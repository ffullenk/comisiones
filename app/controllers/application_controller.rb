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

  def is_a_valid_email?(email)
  # Check the number of '@' signs.
  if email.count("@") != 1 then
    return false

  # We can now check the email using a simple regex.
  # You can replace the TLD's at the end with the TLD's you wish
  # to accept.
  elsif email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i then
    return true
  else
    return false
  end
end


end
