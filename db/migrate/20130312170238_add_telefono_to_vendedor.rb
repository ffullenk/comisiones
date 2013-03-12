class AddTelefonoToVendedor < ActiveRecord::Migration
  def change
    add_column :vendedors, :telefono, :string
  end
end
