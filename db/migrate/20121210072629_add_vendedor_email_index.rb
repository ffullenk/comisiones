class AddVendedorEmailIndex < ActiveRecord::Migration
  def up
  	add_index :vendedors, :email, :unique => true
  end

  def down
  end
end
