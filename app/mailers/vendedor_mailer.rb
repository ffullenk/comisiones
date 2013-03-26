# encoding: UTF-8
class VendedorMailer < ActionMailer::Base
  default from: "\"Comisiones.cl\" <noresponder@comisiones.cl>"

   def welcome_mail(vendedor)
    @vendedor = vendedor
    email_with_name = "#{@vendedor.nombre} <#{@vendedor.email}>"
    @url  = "http://www.comisiones.cl"
    mail(:to =>  email_with_name, :subject => "Bienvenido a Comisiones.cl")
  end
end
