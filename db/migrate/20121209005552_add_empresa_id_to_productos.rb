class AddEmpresaIdToProductos < ActiveRecord::Migration
  def change
  	 add_column :productos, :empresa_id, :integer
  end
end
