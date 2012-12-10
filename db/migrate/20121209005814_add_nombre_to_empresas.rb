class AddNombreToEmpresas < ActiveRecord::Migration
  def change
  	 add_column :empresas, :nombre, :string
  end
end
