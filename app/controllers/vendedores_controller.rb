class VendedoresController < ApplicationController

	def miperfil

		@vendedor = Vendedor.find(params[:vendedor_id])
		if (!@vendedor.id.eql? current_vendedor.id)
			@vendedor = current_vendedor
		end
	end

end
