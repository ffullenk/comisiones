class AddNombreToVendedors < ActiveRecord::Migration
  def change
    add_column :vendedors, :nombre, :string
  end
end
