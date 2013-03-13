class AddActiveToEmpresa < ActiveRecord::Migration
  def change
    add_column :empresas, :active, :boolean, :default => false
  end
end
