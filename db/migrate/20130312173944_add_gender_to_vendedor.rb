class AddGenderToVendedor < ActiveRecord::Migration
  def change
    add_column :vendedors, :gender, :string
  end
end
