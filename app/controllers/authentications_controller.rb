class AuthenticationsController < ApplicationController
  
  def create
  auth = request.env["omniauth.auth"]
 
  # Try to find authentication first
  authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])
 
  if authentication && authentication.user.present?
    # Authentication found, sign the user in.
    flash[:notice] = "Ingreso exitoso."
    sign_in_and_redirect(:vendedor, authentication.user)
  else
    # Authentication not found, thus a new user.

  email = auth['extra']['raw_info']['email']

  us = Vendedor.find_by_email(email)
  if(us)
    flash[:notice] = "Ingreso exitoso."
      sign_in_and_redirect(:vendedor, us)
  else
    vendedor = Vendedor.new
    vendedor.apply_omniauth(auth)
    if vendedor.save(:validate => false)
      flash[:notice] = "Cuenta creada, ingreso exitoso."
      sign_in_and_redirect(:vendedor, vendedor)
    else
      flash[:error] = "Error al crear la cuenta, reintente."
      redirect_to root_url
    end
  end
  end
end
end
