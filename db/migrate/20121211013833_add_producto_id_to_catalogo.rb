class AddProductoIdToCatalogo < ActiveRecord::Migration
  def change
  	add_column :catalogos, :producto_id, :integer
  end
end
