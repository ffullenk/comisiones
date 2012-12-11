class AddComisionesToProductos < ActiveRecord::Migration
  def change
    add_column :productos, :comision, :integer
  end
end
