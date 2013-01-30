class VendedoresController < ApplicationController

	def miperfil
		@vendedor = Vendedor.find(params[:vendedor_id])
		
	end

end
