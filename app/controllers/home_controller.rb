class HomeController < ApplicationController
  def index

  	if vendedor_signed_in?
  		vendedor_home
  		
  	end


  	if empresa_signed_in?
  		empresa_home
  		
  	end
  end


  def empresa_home
  	redirect_to productos_empresa_path(current_empresa.id)
  end

  def vendedor_home
  	redirect_to productos_path

  end
end
