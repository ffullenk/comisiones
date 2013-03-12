# encoding: UTF-8
class Vendedor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nombre, :gender, :telefono, :rut, :direccion, :comuna_id, :universidad_id
  # attr_accessible :title, :body
  has_many :authentications, :dependent => :delete_all
  has_many :pedidos
  has_many :empresas, :through => :assignments
  has_many :catalogos
  validates :email, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  #validates_uniqueness_of :rut, :format => { :with => /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i ,:message=>"Rut inválido"}
  validates :rut, :uniqueness => true, :format => { :with => /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i ,:message=>"Rut inválido"}
                      
  belongs_to :comuna
  belongs_to :universidad

  def apply_omniauth(auth)
  # In previous omniauth, 'user_info' was used in place of 'raw_info'
  self.email = auth['extra']['raw_info']['email']
  self.nombre  = auth['extra']['raw_info']['name']
  #self.location = auth['info']['location']
  # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
  authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
end
end
