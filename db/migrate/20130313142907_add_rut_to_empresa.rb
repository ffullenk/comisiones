class AddRutToEmpresa < ActiveRecord::Migration
  def change
    add_column :empresas, :rut, :string
  end
end
