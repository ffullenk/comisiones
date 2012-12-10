class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.integer :producto_id
      t.integer :vendedor_id
      t.integer :empresa_id
      t.integer :cantidad

      t.timestamps
    end
  end
end
