class Cliente < ActiveRecord::Base
  attr_accessible :ciudad, :direccion, :email, :nombre, :pedido_id

  belongs_to :pedido
end
