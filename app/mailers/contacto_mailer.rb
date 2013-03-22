class ContactoMailer < ActionMailer::Base
   default from: "\"Comisiones.cl\" <noresponder@comisiones.cl>"

   def contacto_mail(nombre,email,mensaje)
    @mensaje = mensaje
    @nombre = nombre
    @email = email
    email_with_name = "#{nombre} <#{email}>"
    @url  = "http://www.comisiones.cl"
    mail(:to =>  "contacto@comisiones.cl",:from=> email, :subject => "Contacto")
  end
end
