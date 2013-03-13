class AddRepresentanteDireccionComunaTelefonoToEmpresa < ActiveRecord::Migration
  def change
    add_column :empresas, :representante, :string
    add_column :empresas, :direccion, :string
   
    add_column :empresas, :telefono, :string
    change_table :empresas do |t|
      t.references :comuna
    end
  end
end
