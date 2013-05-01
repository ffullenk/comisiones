class VendedoresController < ApplicationController

	def miperfil

		@vendedor = Vendedor.find(params[:vendedor_id])
		if (!@vendedor.id.eql? current_vendedor.id)
			@vendedor = current_vendedor
			@pedidos = Pedido.where(:vendedor_id=>current_vendedor.id, :confirmado=>true)
		end
	end


	def comisiones_vendedor
    @pedidos = Pedido.where(:vendedor_id=>current_vendedor.id, :confirmado=>true).page(params[:page])
  end

end
