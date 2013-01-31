class Producto < ActiveRecord::Base
  attr_accessible :descripcion, :nombre, :precio, :empresa_id,:avatar
  has_attached_file :avatar,
   :styles => { :medium => "300x300", :thumb => "100x100" , :index =>"400x600"},
   :storage => :dropbox, :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",  
   :dropbox_options => {
      :unique_filename => true
    }
  has_many :pedidos
  belongs_to :empresa
  
end
