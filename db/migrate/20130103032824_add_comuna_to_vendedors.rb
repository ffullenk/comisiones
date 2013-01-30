class AddComunaToVendedors < ActiveRecord::Migration
  def change
    add_column :vendedors, :comuna_id, :integer
  end
end
