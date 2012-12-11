class AddUniqueIndexToCatalogos < ActiveRecord::Migration
  def change
  	add_index :catalogos, ["producto_id", "vendedor_id"], :unique => true
  end
end
