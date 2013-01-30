class AddDireccionToVendedors < ActiveRecord::Migration
  def change
    add_column :vendedors, :direccion, :string
  end
end
