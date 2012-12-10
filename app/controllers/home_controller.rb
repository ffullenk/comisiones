class HomeController < ApplicationController
  def index

  	if vendedor_signed_in?
  		redirect_to productos_path
  	end
  end
end
