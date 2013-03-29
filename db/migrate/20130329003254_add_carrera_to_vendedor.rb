class AddCarreraToVendedor < ActiveRecord::Migration
  def change
  change_table :vendedors do |t|
      t.references :carrera
    end
end
end
