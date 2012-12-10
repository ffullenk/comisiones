class PedidosController< ApplicationController
   before_filter :find_producto, :except => [:pedidos_empresa, :show_empresa, :confirmar_pedido_empresa, :pedidos_vendedor, :show_vendedor]
   before_filter :authenticate_empresa!, :only => [:pedidos_empresa]
   before_filter :authenticate_vendedor!, :only => [:new,:create]



   def pedidos_empresa
    #lista los pedidos de una empresa
    #@pedidos = Pedido.where(:empresa_id => current_empresa.id)
    @pedidos = current_empresa.pedidos
    @empresa = current_empresa

     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pedidos }
      end
    end

     def show_empresa
      #muestra detalle de pedido de producto a empresa
      @producto = Producto.find(params[:producto_id])
      @pedido = @producto.pedidos.find(params[:pedido_id])
      @vendedor = @pedido.vendedor
   

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pedido }
    end
  end

  def confirmar_pedido_empresa
    #empresa confirma el pedido recibido
    pedido = Pedido.find(params[:pedido_id])

    pedido.confirmado = true
    pedido.save

    redirect_to pedido_empresa_path(pedido),notice: 'Pedido fue confirmado exitosamente.'

  end


  def pedidos_vendedor
      #lista los pedidos que ha generado el vendedor
    @pedidos = current_vendedor.pedidos
  end

  def show_vendedor
      #muestra detalle de pedido de producto al vendedor
      
      @pedido = Pedido.find(params[:pedido_id])
      @producto = Producto.find(@pedido.producto_id)
      


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pedido }
    end
  end

  # GET /pedidos
  # GET /pedidos.json
  def index
    @pedidos = @producto.pedidos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pedidos }
    end
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    @pedido = Pedido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pedido }
    end
  end

  # GET /pedidos/new
  # GET /pedidos/new.json
  def new


    @pedido = @producto.pedidos.build
    @producto
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pedido }
    end
  end

  # GET /pedidos/1/edit
  def edit
    @pedido = Pedido.find(params[:id])
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    #@pedido = Pedido.new(params[:pedido].merge!(:vendedor => current_vendedor))

   @pedido = @producto.pedidos.build(params[:pedido].merge!(:vendedor_id => current_vendedor.id))
    respond_to do |format|
      if @pedido.save
        format.html { redirect_to [@producto,@pedido], notice: 'Pedido was successfully created.' }
       
      else
        format.html { render action: "new" }
       
      end
    end
  end

  # PUT /pedidos/1
  # PUT /pedidos/1.json
  def update
    @pedido = Pedido.find(params[:id])

    respond_to do |format|
      if @pedido.update_attributes(params[:pedido])
        format.html { redirect_to @pedido, notice: 'Pedido was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to pedidos_url }
      format.json { head :no_content }
    end
  end


    private
  def find_producto
    @producto = Producto.find(params[:producto_id])
    rescue ActiveRecord::RecordNotFound
    flash[:error] = "El producto solicitado no pudo ser encontrado."
    redirect_to productos_path
  end
end