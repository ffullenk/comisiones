# encoding: UTF-8
class Empresa < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, 
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nombre, :rut, :representante, :direccion, :telefono, :comuna_id, :url
  # attr_accessible :title, :body
  validates :email, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :rut, :uniqueness => true, :format => { :with => /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i ,:message=>"Rut inválido"}
  
  has_many :productos
  has_many :pedidos
  has_many :vendedors, :through => :pedidos
  belongs_to :comuna


  def active_for_authentication?
  super && active?
  end

  #after_create :welcome_mail

  def confirm!
  super
  welcome_mail
end

private

  def welcome_mail
    EmpresaMailer.welcome_mail(self).deliver
  end
end
