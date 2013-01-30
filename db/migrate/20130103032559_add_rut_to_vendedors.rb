class AddRutToVendedors < ActiveRecord::Migration
  def change
    add_column :vendedors, :rut, :string
  end
end
