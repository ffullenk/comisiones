class AddConfirmadoToPedidos < ActiveRecord::Migration
  def change
    add_column :pedidos, :confirmado, :boolean, :default => false

    
  end
end
