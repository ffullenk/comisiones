class EmpresaMailer < ActionMailer::Base
  default from: "\"Comisiones.cl\" <noresponder@comisiones.cl>"


   def welcome_mail(empresa)
    @empresa = empresa
    email_with_name = "#{@empresa.nombre} <#{@empresa.email}>"
    @url  = "http://www.comisiones.cl"
    mail(:to =>  email_with_name, :subject => "Bienvenido a Comisiones.cl")
  end
end
