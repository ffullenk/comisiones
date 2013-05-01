class Pedido < ActiveRecord::Base
  attr_accessible :cantidad, :empresa_id, :producto_id, :vendedor_id

  belongs_to :producto
  belongs_to :vendedor
  belongs_to :empresa
  has_one :cliente

  paginates_per 10
end




