class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :direccion
      t.string :ciudad
      t.string :email

      t.timestamps
    end
  end
end
