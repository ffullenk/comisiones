class AddUrlToEmpresa < ActiveRecord::Migration
  def change
    add_column :empresas, :url, :string
  end
end
