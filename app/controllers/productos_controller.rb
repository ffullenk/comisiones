# encoding: UTF-8
class ProductosController < ApplicationController

before_filter :authenticate_empresa!, :only => [:new,:create,:edit, :update, :destroy, :productos_empresa]


  def productos_empresa
    #lista productos de una determinada empresa
    @productos = Producto.where(:empresa_id => current_empresa.id)
    @empresa = current_empresa

     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productos }
      end
    end
  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @productos }
    end
  end

  # GET /productos/1
  # GET /productos/1.json
  def show
    @producto = Producto.find(params[:id])

    if current_vendedor

      @catalogo = Catalogo.where(:vendedor_id=>current_vendedor.id, :producto_id=>@producto.id)


      if @catalogo.empty?
        @enCatalogo = false
      else
        @enCatalogo = true
      end
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @producto }
    end
  end

  # GET /productos/new
  # GET /productos/new.json
  def new
    @producto = Producto.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @producto }
    end
  end

  # GET /productos/1/edit
  def edit
    @producto = Producto.find(params[:id])
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(params[:producto].merge!(:empresa_id=>current_empresa.id))

    respond_to do |format|
      if @producto.save
        format.html { redirect_to producto_empresa_path(current_empresa.id,@producto), notice: 'El Producto fue publicado exitosamente.' }
        format.json { render json: @producto, status: :created, location: @producto }
      else
        format.html { render action: "new" }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /productos/1
  # PUT /productos/1.json
  def update
    @producto = Producto.find(params[:id])

    respond_to do |format|
      if @producto.update_attributes(params[:producto])
        format.html { redirect_to producto_empresa_path(current_empresa.id,@producto), notice: 'El Producto fue actualizado exitosamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    @producto = Producto.find(params[:id])
    @producto.destroy

    respond_to do |format|
      format.html { redirect_to productos_url }
      format.json { head :no_content }
    end
  end


   def show_empresa
      #muestra detalle de pedido de producto a empresa
      @producto = Producto.find(params[:producto_id])
 
   

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pedido }
    end
  end




end
