class CreateCatalogos < ActiveRecord::Migration
  def change
    create_table :catalogos do |t|

      t.timestamps
    end
  end
end
