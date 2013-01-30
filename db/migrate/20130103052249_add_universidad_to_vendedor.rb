class AddUniversidadToVendedor < ActiveRecord::Migration
  def change
    add_column :vendedors, :universidad_id, :integer
  end
end
