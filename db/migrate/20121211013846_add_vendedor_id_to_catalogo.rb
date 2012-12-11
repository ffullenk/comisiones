class AddVendedorIdToCatalogo < ActiveRecord::Migration
  def change
  	add_column :catalogos, :vendedor_id, :integer
  end
end
