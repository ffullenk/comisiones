class Pedido < ActiveRecord::Base
  attr_accessible :cantidad, :empresa_id, :producto_id, :vendedor_id

  has_one :producto
  belongs_to :vendedor
  belongs_to :empresa
end




