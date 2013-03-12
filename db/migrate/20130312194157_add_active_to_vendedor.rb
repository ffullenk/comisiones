class AddActiveToVendedor < ActiveRecord::Migration
  def change
    add_column :vendedors, :active, :boolean, :default => false
  end
end
