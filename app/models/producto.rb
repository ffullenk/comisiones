class Producto < ActiveRecord::Base
  attr_accessible :descripcion, :nombre, :precio, :empresa_id,:avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" , :index =>"400x600"}
  has_many :pedidos
  belongs_to :empresa
end
