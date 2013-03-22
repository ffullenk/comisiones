class HomeController < ApplicationController
  def index

  	if vendedor_signed_in? && !empresa_signed_in?
  		vendedor_home
  		
  	end


  	if empresa_signed_in? && !vendedor_signed_in?
  		empresa_home
  		
  	end
  end


  def empresa_home
  	redirect_to productos_empresa_path(current_empresa.id)
  end

  def vendedor_home
  	redirect_to productos_path

  end

  def comisiones_vendedor
    @pedidos = Pedido.where(:vendedor_id=>current_vendedor.id, :confirmado=>true)
  end

  def legal
  end

  def contacto
    if params[:contacto]
      if is_a_valid_email?(params[:contacto][:email])

        ContactoMailer.contacto_mail(params[:contacto][:nombre],params[:contacto][:email],params[:contacto][:mensaje]).deliver


        flash[:notice] = "Gracias por su mensaje."
        redirect_to root_path
      

      else 
        flash[:error] = "Email inválido"
      end
    end


  end
  

end
