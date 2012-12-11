class AddPedidoIdToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :pedido_id, :integer
  end
end
