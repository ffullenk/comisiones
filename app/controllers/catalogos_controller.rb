# encoding: UTF-8
class CatalogosController < ApplicationController
  # GET /catalogos

  # GET /catalogos.json


  def catalogo_vendedor
  	@catalogos = Catalogo.where(:vendedor_id => current_vendedor.id)


  end

  def index
    @catalogos = Catalogo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @catalogos }
    end
  end

  # GET /catalogos/1
  # GET /catalogos/1.json
  def show
    @catalogo = Catalogo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @catalogo }
    end
  end

  # GET /catalogos/new
  # GET /catalogos/new.json
  def new
    @catalogo = Catalogo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @catalogo }
    end
  end

  # GET /catalogos/1/edit
  def edit
    @catalogo = Catalogo.find(params[:id])
  end

  # POST /catalogos
  # POST /catalogos.json
  def create
    @catalogo = Catalogo.new(params[:catalogo])

    respond_to do |format|
      if @catalogo.save
        format.html { redirect_to @catalogo, notice: 'Catalogo was successfully created.' }
        format.json { render json: @catalogo, status: :created, location: @catalogo }
      else
        format.html { render action: "new" }
        format.json { render json: @catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /catalogos/1
  # PUT /catalogos/1.json
  def update
    @catalogo = Catalogo.find(params[:id])

    respond_to do |format|
      if @catalogo.update_attributes(params[:catalogo])
        format.html { redirect_to @catalogo, notice: 'Catalogo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogos/1
  # DELETE /catalogos/1.json
  def destroy
    @catalogo = Catalogo.find(params[:id])
    @catalogo.destroy

    respond_to do |format|
      format.html { redirect_to catalogo_vendedor_path(current_vendedor.id) , notice: 'El Catálogo fue actualizado.' }
      format.json { head :no_content }
    end
  end


  def agregar_producto_catalogo_vendedor
    @producto = Producto.find_by_id(params[:producto_id])

    catalogo = Catalogo.new
    catalogo.producto_id = @producto.id
    catalogo.vendedor_id = current_vendedor.id
     if catalogo.save
        flash[:notice] = "Tu catálogo fue actualizado exitosamente."
        redirect_to @producto
       
      else
        format.html { render action: "show" }
        
      end



  end
end
