# encoding: UTF-8
class Vendedor < ActiveRecord::Base
  after_update :mailActivacion

  # Include default devise modules. Others available are:
  # :token_authenticatable, ,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:active, :password, :password_confirmation, :remember_me, :nombre, :gender, :telefono, :rut, :direccion, :comuna_id, :universidad_id, :carrera_id
  # attr_accessible :title, :body
  has_many :authentications, :dependent => :delete_all
  has_many :pedidos
  has_many :empresas, :through => :pedidos
  has_many :catalogos
  validates :email, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i ,:message=>"Email inválido" }
  #validates_uniqueness_of :rut, :format => { :with => /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i ,:message=>"Rut inválido"}
  validates :rut, :uniqueness => true, :format => { :with => /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i ,:message=>"Rut inválido"}
                      
  belongs_to :comuna
  belongs_to :universidad
  belongs_to :carrera

  validates :comuna, :presence => true
  validates :universidad, :presence => true
  validates :carrera, :presence => true

  validates_format_of :nombre, :with => /^[^0-9`!@#\$%\^&*+_=]+$/
  # add any other characters you'd like to disallow inside the [ brackets ]
  # metacharacters [, \, ^, $, ., |, ?, *, +, (, and ) need to be escaped with a \

  def active_for_authentication?
  super && active?
  end

  def apply_omniauth(auth)
  # In previous omniauth, 'user_info' was used in place of 'raw_info'
  self.email = auth['extra']['raw_info']['email']
  self.nombre  = auth['extra']['raw_info']['name']
  #self.location = auth['info']['location']
  # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
  authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
end


  #after_create :welcome_mail

  def confirm!
  super
  welcome_mail
end

private

  def welcome_mail
    VendedorMailer.welcome_mail(self).deliver
  end

  def mailActivacion
    if active? and (sign_in_count.eql? 0)
      VendedorMailer.activation_mail(self).deliver

    end
  end


end
