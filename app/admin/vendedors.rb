ActiveAdmin.register Vendedor do
   index do

   	column :id do |vendedor|
      link_to vendedor.id, admin_vendedor_path(vendedor)
    end
	column :email
	column :nombre
	column :active
    column :gender
    column :telefono
    column :rut
    column :direccion
    column :pedidos do |vendedor|
    	link_to vendedor.pedidos.count, admin_pedidos_path
    end


    column :comuna do |vendedor|
      link_to vendedor.comuna.nombre, admin_comuna_path(vendedor.comuna)
    end

    column :universidad do |vendedor|
      link_to vendedor.universidad.nombre, admin_universidad_path(vendedor.universidad)
    end
   end



   show do |ad|
      attributes_table do
        row :id
        row :email
        row :nombre
        row :active
        row :gender
        row :telefono
        row :rut
        row :direccion
        row :pedidos do |vendedor|
    		link_to vendedor.pedidos.count, admin_pedidos_path
   		end

   		row :comuna do |vendedor|
     	 link_to vendedor.comuna.nombre, admin_comuna_path(vendedor.comuna)
    	end

	    row :universidad do |vendedor|
	      link_to vendedor.universidad.nombre, admin_universidad_path(vendedor.universidad)
	    end


      end
      
    end


    form do |f|
      f.inputs "Datos" do

        f.input :email, :label => "Email"
        f.input :gender
        f.input :telefono
        f.input :rut
        f.input :nombre
        f.input :direccion

        f.input :comuna, :label => 'Comuna', :as => :select, :collection => Comuna.all.map{|u| ["#{u.nombre}", u.id]}
    
        f.input :universidad, :label => 'Universidad', :as => :select, :collection => Universidad.all.map{|u| ["#{u.nombre}", u.id]}
    
      end
      f.inputs "Activacion" do
        f.input :active
      end
      f.buttons
    end



end
