class Producto < ActiveRecord::Base
  attr_accessible :descripcion, :nombre, :precio, :empresa_id

  has_many :pedidos
  belongs_to :empresa
end
