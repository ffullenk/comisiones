class AddCamposToComuna < ActiveRecord::Migration
  def change
    add_column :comunas, :code, :string
    add_column :comunas, :provincia, :string
    add_column :comunas, :region, :string
    add_column :comunas, :region_number, :string
  end
end
